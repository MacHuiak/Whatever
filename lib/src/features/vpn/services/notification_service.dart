import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationServiceImpl {
  final _localNotifications = FlutterLocalNotificationsPlugin();



  final Map<String, String> _notificationInfo = {
    S.current.ensureSecurity: S.current.ensureSecurityBody,
    S.current.guardYourPrivacy: S.current.guardYourPrivacyBody,
    S.current.alertUnsecuredWifi: S.current.alertUnsecuredWifiBody,
    S.current.publicNetworkWarning: S.current.publicNetworkWarningBody,
    S.current.vpnAlert: S.current.vpnAlertBody,
    S.current.bewareOfHackersBody: S.current.bewareOfHackers,
    S.current.yourDataIsVulnerable: S.current.yourDataIsVulnerableBody,
    S.current.prioritizePrivacy: S.current.prioritizePrivacyBody,
    S.current.secureYourOnlineFootprint:
        S.current.secureYourOnlineFootprintBody,
    S.current.vpnOnthego: S.current.vpnOnthegoBody
  };

  DarwinNotificationDetails iosNotificationDetails =
      const DarwinNotificationDetails(threadIdentifier: 'whatever_vpn');

  NotificationServiceImpl() {
    init();
    tz.initializeTimeZones();
  }

  Future<void> close() async {}

  Future<void> init() async {
    DarwinInitializationSettings initializationIOSSettings =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: _onIOSReceiveLocalNotification);
    await _localNotifications
        .initialize(InitializationSettings(iOS: initializationIOSSettings));
  }

  void _onIOSReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    dev.log("onReceiveLocalNotification");
  }

  void scheduleNotification() {
    cancelAllNotifications();
    for (int i = 0; i < 16; i++) {
      final first = _notificationInfo.keys.elementAt(Random().nextInt(10));
      final second = _notificationInfo.keys.elementAt(Random().nextInt(10));
      final third = _notificationInfo.keys.elementAt(Random().nextInt(10));
      final forth = _notificationInfo.keys.elementAt(Random().nextInt(10));
      final notificationTime = _nextTime(daysAhead: i + 1);
      _localNotifications.zonedSchedule(i, first, _notificationInfo[first],
          notificationTime.$1, NotificationDetails(iOS: iosNotificationDetails),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
      _localNotifications.zonedSchedule(i, second, _notificationInfo[second],
          notificationTime.$2, NotificationDetails(iOS: iosNotificationDetails),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
      _localNotifications.zonedSchedule(i, third, _notificationInfo[third],
          notificationTime.$3, NotificationDetails(iOS: iosNotificationDetails),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
      _localNotifications.zonedSchedule(i, forth, _notificationInfo[forth],
          notificationTime.$4, NotificationDetails(iOS: iosNotificationDetails),
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
    }
  }

  void showNotification() {
    scheduleNotification();
  }

  (tz.TZDateTime, tz.TZDateTime, tz.TZDateTime, tz.TZDateTime) _nextTime(
      {int daysAhead = 0}) {
    final currentDate = DateTime.now();
    final now = currentDate.toUtc();
    int firstTimeDifference = 10 - currentDate.hour;
    int secondTimeDifference = 18 - currentDate.hour;
    int thirdTimeDifference = 14 - currentDate.hour;
    int forthTimeDifference = 20 - currentDate.hour;
    tz.TZDateTime scheduledDateFirst =
        _getScheduleTime(now, daysAhead, firstTimeDifference);
    tz.TZDateTime scheduledDateSecond =
        _getScheduleTime(now, daysAhead, secondTimeDifference);
    tz.TZDateTime scheduledDateThird =
        _getScheduleTime(now, daysAhead, thirdTimeDifference);
    tz.TZDateTime scheduledDateForth =
        _getScheduleTime(now, daysAhead, forthTimeDifference);
    return (
      scheduledDateFirst,
      scheduledDateSecond,
      scheduledDateThird,
      scheduledDateForth
    );
  }

  tz.TZDateTime _getScheduleTime(
      DateTime now, int daysAhead, int hourAddition) {
    tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
        now.day + daysAhead, now.hour + hourAddition, now.minute);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future<void> cancelAllNotifications() async {
    await _localNotifications.cancelAll();
  }
}
