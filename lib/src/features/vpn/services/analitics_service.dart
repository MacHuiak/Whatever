import 'package:flutter/services.dart';

enum AnalyticsEvent {
  install("install"),
  renew("renew"),
  trial("trial"),
  buySubscription("buySubscription");

  const AnalyticsEvent(this.name);

  final String name;
}

class AnalyticsServiceImpl {
  final MethodChannel _vpnChannel =
      const MethodChannel("com.whatever.log_handler");

  Future<void> logEvent(AnalyticsEvent event,
      {Map<String, dynamic>? params, double? height, double? width}) async {
    _vpnChannel.invokeMethod("logEvent", event.name);
  }

  Future<void> logBuySubscription(AnalyticsEvent event,
      {required String purchaseID}) async {
    _vpnChannel.invokeMethod(
        "buySubscription", {"event": event.name, "purchaseId": purchaseID});
  }
}
