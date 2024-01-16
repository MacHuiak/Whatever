import 'package:rx_shared_preferences/rx_shared_preferences.dart';

const String launchCountKey = "launchCountKey";

class RateService {
  final SharedPreferences _preferences;

  RateService({required SharedPreferences preferences})
      : _preferences = preferences;

  bool shouldRate() {
    final launchCount = getLaunchCount();
    return launchCount == 0;
  }

  int getLaunchCount() => _preferences.getInt(launchCountKey) ?? 0;

  Future<int> updateCount() async {
    final launchCount = getLaunchCount();
    await _preferences.setInt(launchCountKey, launchCount + 1);
    return launchCount;
  }
}
