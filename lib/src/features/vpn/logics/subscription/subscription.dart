import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/features/vpn/models/subscription_info.dart';
import 'package:modern_vpn_project/src/features/vpn/services/payment_service.dart';

final subscriptionStatusController =
    AsyncNotifierProvider<SubscriptionStatusController, SubscriptionInfo?>(() {
  return SubscriptionStatusController(
      paymentService: DI.getDependency<IOSPaymentServiceImpl>());
});

class SubscriptionStatusController extends AsyncNotifier<SubscriptionInfo?> {
  final IOSPaymentServiceImpl paymentService;

  SubscriptionStatusController({required this.paymentService});


  void updateSubscriptionStatus(SubscriptionInfo? subscriptionInfo){
    state = AsyncValue.data(subscriptionInfo);
  }

  @override
  Future<SubscriptionInfo?> build() async {
    final subscriptionStatus = await paymentService.haveAccess();
    paymentService.subscriptionStream.listen((event) {
      updateSubscriptionStatus(event);
    });
    return subscriptionStatus;
  }

  Future<void> buySubscription() async {
    await paymentService.buySubscription();
  }

  Future<void> restoreSubscription() async {
    await paymentService.restorePayment();
  }

}
