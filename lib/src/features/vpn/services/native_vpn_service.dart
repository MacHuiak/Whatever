import 'dart:async';

import 'package:flutter/services.dart';
import 'package:modern_vpn_project/src/features/vpn/models/connection_vpn_status.dart';
import 'package:modern_vpn_project/src/features/vpn/models/data_counter_class.dart';
import 'package:rxdart/rxdart.dart';

class IosVPNService {
  final StreamController<ConnectionStatus> _connectionTypeController =
      BehaviorSubject<ConnectionStatus>();
  final StreamController<int> _connectionTimeController = BehaviorSubject<int>();
  final StreamController<DataCountInfo> _connectionDataCountController =
      BehaviorSubject<DataCountInfo>();

  Stream<ConnectionStatus> get connectionStatusStream =>
      _connectionTypeController.stream;

  Stream<int> get connectionTimeStream => _connectionTimeController.stream;

  Stream<DataCountInfo> get connectionDataCountStream =>
      _connectionDataCountController.stream;

  final MethodChannel _flutterChannel =
      const MethodChannel("com.whatever.flutter_call");

  late NativeCallbackHandler _nativeCallbackHandler;

  IosVPNService() {
    _nativeCallbackHandler = NativeCallbackHandler(onTimeGet: (int time) {
      _connectionTimeController.add(time);
    }, onDataCountGet: (DataCountInfo dataCount) {
      _connectionDataCountController.add(dataCount);
    }, onConnectionStatusGet: (ConnectionStatus connectionStatus) {
      _connectionTypeController.add(connectionStatus);
    });
  }

  Future<void> close() async {
    await _connectionTimeController.close();
    await _connectionTypeController.close();
    await _connectionDataCountController.close();
  }

  Future<void> initConnection() async {
    await _flutterChannel.invokeMethod("init_connection");
  }

  Future<void> startConnection({required String config}) async {
    await _flutterChannel.invokeMethod("start_vpn", {"vpn_config": config});
  }

  Future<void> stopConnection() async {
    await _flutterChannel.invokeMethod("stop_vpn");
  }

// Stream<ConnectionTypeElement> get connectionStatusStream =
}

class NativeCallbackHandler {
  final void Function(int time) onTimeGet;
  final void Function(DataCountInfo dataCount) onDataCountGet;
  final void Function(ConnectionStatus connectionStatus) onConnectionStatusGet;
  final MethodChannel _nativeCallbackChannel =
      const MethodChannel("com.whatever.native_call");

  NativeCallbackHandler(
      {required this.onTimeGet,
      required this.onDataCountGet,
      required this.onConnectionStatusGet}) {
    _nativeCallbackChannel
        .setMethodCallHandler((call) => nativeCallbackHandler(call));
  }

  Future<void> nativeCallbackHandler(MethodCall call) async {
    switch (call.method) {
      case "send_vpn_status":
        final connectionStatus = call.arguments["connectionStatus"];

        onConnectionStatusGet(ConnectionStatus.getTypeByName(connectionStatus));
        break;
      case "send_connection_time":
        int connectionTime = call.arguments["activeConnectionTimeStamp"];
        onTimeGet(connectionTime);
        break;
      case "send_data_count":
        final byteSent = call.arguments["byteSent"];
        final byteReceived = call.arguments["byteReceived"];
        onDataCountGet(
            DataCountInfo(byteSent: byteSent, byteReceived: byteReceived));
        break;
    }
  }
}