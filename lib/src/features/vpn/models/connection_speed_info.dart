import 'package:flutter/foundation.dart';

@immutable
class DataCount {
  final int? byteSent;
  final int? byteReceived;

  const DataCount({required this.byteSent, required this.byteReceived});

  @override
  bool operator ==(Object other) =>
      identical(this, other) &&
      other is DataCount &&
      runtimeType == other.runtimeType &&
      byteReceived == other.byteReceived;

  @override
  int get hashCode => byteReceived.hashCode & byteSent.hashCode;
}

@immutable
class ConnectionSpeed {
  final String speedValue;
  final String measureUnit;

  const ConnectionSpeed({required this.speedValue, required this.measureUnit});

  @override
  bool operator ==(Object other) =>
      identical(this, other) &&
      other is ConnectionSpeed &&
      runtimeType == other.runtimeType &&
      speedValue == other.speedValue;

  @override
  int get hashCode => speedValue.hashCode & measureUnit.hashCode;
}
