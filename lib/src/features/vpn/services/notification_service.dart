




//class NotificationServiceImpl implements INotificationService {
//   final _localNotifications = FlutterLocalNotificationsPlugin();
//   final BehaviorSubject<ReceivedNotification>
//       didReceiveLocalNotificationSubject =
//       BehaviorSubject<ReceivedNotification>();
//
//   final Map<String, String> _notificationInfo = {
//     "Ensure your security": "Secure your data from third-party tracking.",
//     "Protect your device":
//         "Ensure the connection remains inaccessible to unauthorized parties.",
//     "Your anonimity may be compromised!":
//         "Defend your data against external tracing.",
//     "Faster and safer!": "Protect and monitor your connection."
//   };
//
//   DarwinNotificationDetails iosNotificationDetails =
//       const DarwinNotificationDetails(threadIdentifier: 'vpn_thread');
//
//   NotificationServiceImpl() {
//     init();
//     tz.initializeTimeZones();
//   }
//
//   @override
//   Future<void> close() async {}
//
//   @override
//   Future<void> init() async {
//     DarwinInitializationSettings initializationIOSSettings =
//         DarwinInitializationSettings(
//             onDidReceiveLocalNotification: _onIOSReceiveLocalNotification);
//     await _localNotifications
//         .initialize(InitializationSettings(iOS: initializationIOSSettings));
//   }
//
//   void _onIOSReceiveLocalNotification(
//       int id, String? title, String? body, String? payload) {
//     dev.log("onReceiveLocalNotification");
//   }
//
//   @override
//   void scheduleNotification() {
//     cancelAllNotifications();
//     for (int i = 0; i < 28; i++) {
//       int elementIndex = i%4;
//
//       final notificationTime = _nextTime(daysAhead: i + 1);
//       _localNotifications.zonedSchedule(
//           elementIndex,
//           _notificationInfo.keys.elementAt(elementIndex),
//           _notificationInfo.values.elementAt(elementIndex),
//           notificationTime.item1,
//           NotificationDetails(iOS: iosNotificationDetails),
//           uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime);
//       _localNotifications.zonedSchedule(
//           elementIndex,
//           _notificationInfo.keys.elementAt(elementIndex),
//           _notificationInfo.values.elementAt(elementIndex),
//           notificationTime.item2,
//           NotificationDetails(iOS: iosNotificationDetails),
//           uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime);
//     }
//   }
//
//   @override
//   void showNotification() {
//     scheduleNotification();
//   }
//
//   Tuple2<tz.TZDateTime,tz.TZDateTime> _nextTime({int daysAhead = 0}) {
//     final currentDate = DateTime.now();
//     final now = currentDate.toUtc();
//     int firstTimeDifference =10-currentDate.hour;
//     int secondTimeDifference = 18 - currentDate.hour;
//     tz.TZDateTime scheduledDateFirst = _getScheduleTime(now, daysAhead,firstTimeDifference);
//     tz.TZDateTime scheduledDateSecond = _getScheduleTime(now, daysAhead,secondTimeDifference);
//     return Tuple2<tz.TZDateTime,tz.TZDateTime>(scheduledDateFirst,scheduledDateSecond);
//   }
//
//   tz.TZDateTime _getScheduleTime(DateTime now, int daysAhead,int hourAddition) {
//     tz.TZDateTime scheduledDate = tz.TZDateTime(tz.local, now.year, now.month,
//         now.day+ daysAhead, now.hour + hourAddition, now.minute );
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }
//
//   @override
//   Future<void> cancelAllNotifications() async {
//     await _localNotifications.cancelAll();
//   }
//
//   @override
//   Future<void> cancelNotification(int id) async {
//     // TODO: implement cancelNotification
//   }
// }