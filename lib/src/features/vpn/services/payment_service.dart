import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:modern_vpn_project/src/features/vpn/models/subscription_info.dart';
import 'package:modern_vpn_project/src/features/vpn/services/analitics_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/notification_service.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const String storeKeyOneWeekSubscription = 'one_week_access';

class IOSPaymentServiceImpl {
  static InAppPurchase? _instance;
  static StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;

  final StreamController<SubscriptionInfo?> _subscriptionController =
      BehaviorSubject<SubscriptionInfo?>();

  List<PurchasedItem>? _transactions;
  late ProductDetails _productDetail;
  DateTime? _lastPurchaseDate;

  final AnalyticsServiceImpl analyticsService;
  final NotificationServiceImpl notificationService;

  IOSPaymentServiceImpl({required this.analyticsService, required this.notificationService});

  static InAppPurchase get _getInstance {
    _instance ??= InAppPurchase.instance;
    return _instance!;
  }

  static set instance(InAppPurchase instance) {
    _instance = instance;
  }

  Stream<SubscriptionInfo?> get subscriptionStream =>
      _subscriptionController.stream;

  Future<void> loadPurchases() async {
    final available = await _getInstance.isAvailable();
    if (!available) {
      return;
    }
    _purchaseSubscription = _getInstance.purchaseStream.listen((event) {
      _verifyPurchase(event);
    });
    const ids = <String>{
      storeKeyOneWeekSubscription,
    };
    final productsInfo = await _getInstance.queryProductDetails(ids);

    if (productsInfo.productDetails.isNotEmpty) {
      _productDetail = productsInfo.productDetails
          .firstWhere((element) => element.id == "one_week_access");
    }
  }

  Future<void> buySubscription({ProductDetails? productDetails}) async {
    // await Sentry.captureMessage("return status", level: SentryLevel.info);
    await _getInstance.buyNonConsumable(
        purchaseParam:
            PurchaseParam(productDetails: productDetails ?? _productDetail));
  }

  Future<void> _verifyPurchase(List<PurchaseDetails> purchases) async {
    for (PurchaseDetails purchaseDetails in purchases) {
      if (purchaseDetails.pendingCompletePurchase) {
        switch (purchaseDetails.status) {
          case PurchaseStatus.pending:
            // TODO: Handle this case.
            break;
          case PurchaseStatus.purchased:
            Sentry.captureMessage("CATCH PURCHASED DETAIL");
            if (_lastPurchaseDate == null) {
              // _purchaseServiceImpl.savePurchaseDate(
              //     _getDateFromString(purchaseDetails.transactionDate ?? "0"));
              if ((_transactions ?? []).isNotEmpty) {
                Sentry.captureMessage("$_transactions");
                notificationService.cancelAllNotifications();
                analyticsService.logBuySubscription(AnalyticsEvent.trial,
                    purchaseID:
                    _transactions!.first.originalTransactionIdentifierIOS!);
              } else {
                analyticsService.logBuySubscription(AnalyticsEvent.trial,
                    purchaseID:
                        _transactions!.first.originalTransactionIdentifierIOS!);
              }
            }else{
              analyticsService.logBuySubscription(AnalyticsEvent.trial,
                  purchaseID:
                  _transactions!.first.originalTransactionIdentifierIOS!);
            }
            final purchase = _getPurchaseDate(purchaseDetails);
            _lastPurchaseDate = purchase;
            final currentDate = DateTime.now().toUtc();
            final difference = currentDate.difference(purchase);
            if (difference.inMinutes < 10080) {
              _subscriptionController.add(SubscriptionInfo(
                  id: purchaseDetails.purchaseID,
                  expirationTimeStamp:
                      _lastPurchaseDate!.millisecondsSinceEpoch,
                  subscriptionType: "one_week_subscription"));
            }

            break;

          case PurchaseStatus.restored:
            final purchase = _getPurchaseDate(purchaseDetails);
            _lastPurchaseDate = purchase;
            final currentDate = DateTime.now().toUtc();
            final difference = currentDate.difference(purchase);
            if (difference.inMinutes < 10080) {
              _subscriptionController.add(SubscriptionInfo(
                  id: purchaseDetails.purchaseID,
                  expirationTimeStamp:
                      _lastPurchaseDate!.millisecondsSinceEpoch,
                  subscriptionType: "one_week_subscription"));
            }
            break;
          case PurchaseStatus.error:
          case PurchaseStatus.canceled:
            _subscriptionController.add(null);
            break;
        }
        await _getInstance.completePurchase(purchaseDetails);
      }
    }
  }

  Future<void> close() async {
    // _subscriptionController.close();
    _purchaseSubscription?.cancel();
  }

  Future<bool>? isAvailable() {
    return _getInstance.isAvailable();
  }

  Future<SubscriptionInfo?> haveAccess() async {
    try {
      await _getInstance.restorePurchases();
      await FlutterInappPurchase.instance.initialize();
      Sentry.captureMessage("check access");
      List<PurchasedItem>? items = await FlutterInappPurchase.instance
          .getPurchaseHistory()
          .onError((error, stackTrace) {
        Sentry.captureMessage("Error while get items in access check");
        return null;
      });
      if (items != null) {
        items = _getUniqueTransaction(items);
        // await _purchasedItemsDao.savePurchasedItems(items);
      }
      _transactions = items;
      if (items == null || items.isEmpty) {
        await Sentry.captureMessage("return status no element");
        return null;
      }
      PurchasedItem? lastPurchase = items.first;
      DateTime? lastPurchaseDate = items.first.transactionDate;
      _lastPurchaseDate = lastPurchaseDate;
      if (lastPurchaseDate == null) {

        await Sentry.captureMessage("RETURN STATUS NO LAST PURCHASE");
        return null;
      }
      final currentDate = DateTime.now().toUtc();
      final difference = currentDate.difference(lastPurchaseDate);
      final accessStatus =
          difference.inMinutes < ((items.length) > 1 ? 10080 : 4320)
              ? SubscriptionInfo(
                  expirationTimeStamp: lastPurchaseDate.millisecondsSinceEpoch,
                  id: lastPurchase.originalTransactionIdentifierIOS)
              : null;
      if (accessStatus != null) {
        notificationService.cancelAllNotifications();
      } else {
        notificationService.scheduleNotification();
      }
      await Sentry.captureMessage("return status");
      return accessStatus;
    } on Error catch (_) {
      notificationService.scheduleNotification();
      return null;
    }
  }

  List<PurchasedItem> _getUniqueTransaction(List<PurchasedItem> items) {
    HashMap<String, PurchasedItem> originTransactionById =
        HashMap<String, PurchasedItem>();
    items.sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));
    for (PurchasedItem purchase in items) {
      if (!originTransactionById
          .containsKey(purchase.originalTransactionIdentifierIOS)) {
        originTransactionById[purchase.originalTransactionIdentifierIOS!] =
            purchase;
      }
    }

    //originTransactionById.values.toList()..sort((a, b) =>
    //         b.transactionDate!.compareTo(a.transactionDate!));
    return items
      ..sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));
  }

  bool _isSubscriptionActive(final DateTime? purchaseDate) {
    if (purchaseDate == null) return false;
    final currentDate = DateTime.now().toUtc();
    final difference = currentDate.difference(purchaseDate);
    return difference.inMinutes < 10080 ? true : false;
  }

  DateTime _getPurchaseDate(PurchaseDetails purchase) =>
      DateTime.fromMillisecondsSinceEpoch(
          int.parse(purchase.transactionDate ?? "0"),
          isUtc: true);

  Future<DateTime?> _restorePurchase() async {
    try {
      DateTime? lastPurchaseDate;
      List<SKPaymentTransactionWrapper> transactions =
          await SKPaymentQueueWrapper().transactions();

      if (transactions.isEmpty) {
        return null;
      }
      transactions.sort((a, b) => (a.transactionTimeStamp?.toInt() ?? 0)
          .compareTo(b.transactionTimeStamp?.toInt() ?? 0));
      lastPurchaseDate = DateTime.fromMillisecondsSinceEpoch(
          transactions.last.transactionTimeStamp!.toInt() * 1000,
          isUtc: true);
      // _purchaseServiceImpl.savePurchaseDate(lastPurchaseDate);
      return lastPurchaseDate;
    } on Exception catch (_) {
      return null;
    }
  }

  DateTime _getDateFromString(String purchaseDate) =>
      DateTime.fromMillisecondsSinceEpoch(int.parse(purchaseDate ?? "0"),
          isUtc: true);

  DateTime? _getLastPurchaseDate(List<PurchaseDetails> purchase) {
    if (purchase.isEmpty) {
      return null;
    }
    purchase.sort((a, b) => (int.parse(a.transactionDate ?? "0"))
        .compareTo(int.parse(b.transactionDate ?? "0")));
    return _getPurchaseDate(purchase.last);
  }

  //10080
  Future<void> restorePayment() async {
    try {
      await _getInstance.restorePurchases();
    } on Error catch (e) {
      await Sentry.captureMessage("FAILED RESTORE");
    }
  }

  Stream<ProductDetails> get productDetails => const Stream.empty();
}
