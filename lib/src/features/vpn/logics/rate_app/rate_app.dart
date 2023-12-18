import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/features/vpn/services/rate_service.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

final rateNotifier =
    NotifierProvider<RateAppNotifier, bool>(RateAppNotifier.new);

final shouldRateProvider = Provider<bool>((ref) {
  return ref.watch(rateNotifier);
});

class RateAppNotifier extends Notifier<bool> {
  final RateService _rateService =
      RateService(preferences: DI.getDependency<SharedPreferences>());
  final InAppReview _inAppReview = InAppReview.instance;
  final String _appStoreId = "6473805038";

  @override
  bool build() => _rateService.shouldRate();

  Future<void> rateApp(double rate) async {
    if (rate >= 4) {
      final isAvailable = await _inAppReview.isAvailable();
      if (isAvailable) {
        _inAppReview.requestReview();
      }
    }
  }

  void updateLaunchCount() {
    final newCount = _rateService.updateCount();
    state = newCount == 1;
  }
}
