import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseRemoteConfigService {
  final FirebaseRemoteConfig firebaseRemoteConfig;
  final SharedPreferences sharedPreferences;

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
    } on FirebaseRemoteConfig catch (e, st) {
      rethrow;
    }
  }

  int getPaywallType() {
    final savedType = sharedPreferences.getString('paywall_type');
    if (savedType == null) {
      final paywallType = firebaseRemoteConfig.getString('paywall_type');
      sharedPreferences.setString('paywall_type', paywallType);
      return int.tryParse(paywallType) ?? 1;
    } else {
      return int.tryParse(savedType) ?? 1;
    }
  }
}
