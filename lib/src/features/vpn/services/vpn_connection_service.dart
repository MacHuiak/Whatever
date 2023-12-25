import 'dart:developer';

import 'package:modern_vpn_project/src/features/vpn/models/connection_vpn_status.dart';
import 'package:modern_vpn_project/src/features/vpn/models/data_counter_class.dart';
import 'package:modern_vpn_project/src/features/vpn/models/host.dart';
import 'package:modern_vpn_project/src/features/vpn/services/config_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/native_vpn_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class VpnConnectionService {
  final IosVPNService _vpnService;
  final ConfigServiceImpl _configServiceImpl;

  VpnConnectionService(
      {required ConfigServiceImpl configServiceImpl,
      required IosVPNService vpnService})
      : _vpnService = vpnService,
        _configServiceImpl = configServiceImpl;

  Stream<int> get connectionTime => _vpnService.connectionTimeStream;

  Stream<ConnectionStatus> get connectionStatus =>
      _vpnService.connectionStatusStream;

  Stream<DataCountInfo> get connectionDataCount =>
      _vpnService.connectionDataCountStream;

  Future<void> initConnection() async {
    Sentry.captureMessage("TRY INIT");

    _vpnService.initConnection();

    Sentry.captureMessage("TRY INITED");
  }

  Future<void> startConnection(HostData hostData) async {
    Sentry.captureMessage("TRY START FLUTTER VPN CONNECTION");
    initConnection();
    Sentry.captureMessage("FINISH INIT FLUTTER");
    String config = await _configServiceImpl.getConfig(hostData.ip);
    await _vpnService.startConnection(config: config);
    Sentry.captureMessage("FINISH CONNECTION");
  }

  Future<void> stopConnection() async {
    await _vpnService.stopConnection();
  }
}
