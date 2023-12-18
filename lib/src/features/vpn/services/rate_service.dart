import 'package:rx_shared_preferences/rx_shared_preferences.dart';

const String launchCountKey = "launchCountKey";

class RateService {
  final SharedPreferences _preferences;

  RateService({required SharedPreferences preferences})
      : _preferences = preferences;

  bool shouldRate() {
    final launchCount = getLaunchCount();
    return launchCount == 1;
  }

  int getLaunchCount() => _preferences.getInt(launchCountKey) ?? 0;

  int updateCount() {
    final launchCount = getLaunchCount();
    _preferences.setInt(launchCountKey, launchCount + 1);
    return launchCount;
  }
}
