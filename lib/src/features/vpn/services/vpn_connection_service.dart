import 'dart:developer';

import 'package:modern_vpn_project/src/features/vpn/models/connection_vpn_status.dart';
import 'package:modern_vpn_project/src/features/vpn/models/data_counter_class.dart';
import 'package:modern_vpn_project/src/features/vpn/models/host.dart';
import 'package:modern_vpn_project/src/features/vpn/services/config_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/native_vpn_service.dart';

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
      Stream.value(const DataCountInfo(byteSent: 0, byteReceived: 0));

  Future<void> initConnection() async {
    await _vpnService.initConnection();
  }

  Future<void> startConnection(HostData hostData) async {
    await initConnection();
    String config = await _configServiceImpl.getConfig(hostData.ip);
    log("");
    await _vpnService.startConnection(config: config);
  }

  Future<void> stopConnection() async {
    await _vpnService.stopConnection();
  }
}
