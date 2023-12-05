import 'package:flutter/cupertino.dart';

@immutable
class DataCounterClass {
  final int? byteSent;

  final int? byteReceived;

  const DataCounterClass({required this.byteSent, required this.byteReceived});

  ConnectionSpeedInfo get sentDataCountWithUnit => _parseByteByUnit(byteSent);

  ConnectionSpeedInfo get receivedCountWithUnit =>
      _parseByteByUnit(byteReceived);

  ConnectionSpeedInfo _parseByteByUnit(int? byteCount) {
    switch (byteCount) {
      case null:
        return const ConnectionSpeedInfo(speedValue: "0", measureUnit: "B");
      case < 1024:
        return ConnectionSpeedInfo(speedValue: "$byteCount", measureUnit: "B");
      case > 1024:
        return ConnectionSpeedInfo(
            speedValue: (byteCount / 1024).toStringAsFixed(1),
            measureUnit: "KB");
      case > 1024 * 1024:
        return ConnectionSpeedInfo(
            speedValue: (byteCount / (1024 * 1024)).toStringAsFixed(1),
            measureUnit: "MB");
      case > 1024 * 1024 * 1024:
        return ConnectionSpeedInfo(
            speedValue: (byteCount / (1024 * 1024 * 1024)).toStringAsFixed(1),
            measureUnit: "GB");

      default:
        return const ConnectionSpeedInfo(speedValue: "0", measureUnit: "B");
    }
  }
}

class ConnectionSpeedInfo {
  final String speedValue;
  final String measureUnit;

  const ConnectionSpeedInfo(
      {required this.speedValue, required this.measureUnit});
}
