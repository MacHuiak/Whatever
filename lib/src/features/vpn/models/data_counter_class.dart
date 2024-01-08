import 'package:flutter/cupertino.dart';

@immutable
class DataCountInfo {
  final int? byteSent;

  final int? byteReceived;

  const DataCountInfo({required this.byteSent, required this.byteReceived});

  ConnectionSpeedInfo get sentDataCountWithUnit => parseByteByUnit(byteSent);

  ConnectionSpeedInfo get receivedCountWithUnit =>
      parseByteByUnit(byteReceived);

  ConnectionSpeedInfo parseByteByUnit(int? byteCount) {
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

  static ConnectionSpeedInfo getParseByteByUnit(int? byteCount) {
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

  //      case null:
  //         return const ConnectionSpeedInfo(speedValue: "0", measureUnit: "B");
  //       case < 1024:
  //         return ConnectionSpeedInfo(speedValue: "$byteCount", measureUnit: "B");
  //       case > 1024:
  //         return ConnectionSpeedInfo(
  //             speedValue: (byteCount / 1024).toStringAsFixed(1),
  //             measureUnit: "KB");
  //       case > 1024 * 1024:
  //         return ConnectionSpeedInfo(
  //             speedValue: (byteCount / (1024 * 1024)).toStringAsFixed(1),
  //             measureUnit: "MB");
  //       case > 1024 * 1024 * 1024:
  //         return ConnectionSpeedInfo(
  //             speedValue: (byteCount / (1024 * 1024 * 1024)).toStringAsFixed(1),
  //             measureUnit: "GB");
  //
  //       default:
  //         return const ConnectionSpeedInfo(speedValue: "0", measureUnit: "B");

  int getByteCountFromCounted() {
    switch (measureUnit) {
      case "B":
        return int.parse(speedValue);
      case "KB":
        return int.parse(speedValue) * 1024;
      case "MB":
        return int.parse(speedValue) * 1024 * 1024;
      case "GB":
        return int.parse(speedValue) * 1024 * 1024 * 1024;
      default:
        return 0;
    }
  }
}
