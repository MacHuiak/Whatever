import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseRemoteConfigService {
  final FirebaseRemoteConfig firebaseRemoteConfig;
  final SharedPreferences sharedPreferences;

  final _initController = BehaviorSubject<bool>();

  Stream<bool> get remoteConfigStatusStream => _initController.stream;

  FirebaseRemoteConfigService(
      {required this.sharedPreferences, required this.firebaseRemoteConfig});

  Future<void> init() async {
    try {
      await firebaseRemoteConfig.ensureInitialized();
      await firebaseRemoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await firebaseRemoteConfig.fetchAndActivate();
      _initController.add(true);
    } on FirebaseRemoteConfig catch (e, st) {
      rethrow;
    }
  }

  int getPaywallType() {
    final savedType = sharedPreferences.getString('paywall_type');
    if (savedType == null) {
      final paywallType = firebaseRemoteConfig.getString('paywall_type');
      sharedPreferences.setString('paywall_type', paywallType);
      FirebaseAnalytics.instance.logEvent(
        name: "paywall_type_from_config",
        parameters: {"paywall_type": paywallType},
      );
      FirebaseAnalytics.instance.logEvent(
        name: _getPayWallEvent(int.tryParse(paywallType) ?? 1),
      );
      return int.tryParse(paywallType) ?? 1;
    } else {
      return int.tryParse(savedType) ?? 1;
    }
  }

  String _getPayWallEvent(int payWallType) {
    switch (payWallType) {
      case 1:
        return "pay_wall_1";
      case 2:
        return "pay_wall_2";
      case 3:
        return "pay_wall_3";
      case 4:
        return "pay_wall_4";
      case 5:
        return "pay_wall_5";
      case 6:
        return "pay_wall_6";
      case 7:
        return "pay_wall_7";
      default:
        return "pay_wall_1";
    }
  }
}
