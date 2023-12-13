import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/features/vpn/models/connection_vpn_status.dart';
import 'package:modern_vpn_project/src/features/vpn/models/data_counter_class.dart';
import 'package:modern_vpn_project/src/features/vpn/models/host.dart';
import 'package:modern_vpn_project/src/features/vpn/services/vpn_connection_service.dart';

final connectionProvider =
    NotifierProvider<ConnectionInfo, ConnectionStatus>(ConnectionInfo.new);

final connectionTimeProvider = Provider<int>((ref) {
  return 1;
});

final dataCounterSpeedProvider = Provider<DataCountInfo>((ref) {
  return const DataCountInfo(byteReceived: 0, byteSent: 0);
});

class ConnectionInfo extends Notifier<ConnectionStatus> {
  final VpnConnectionService _connectionService =
      DI.getDependency<VpnConnectionService>();

  @override
  ConnectionStatus build() => ConnectionStatus.disconnected;

  void startConnection(HostData host) {
    _connectionService.startConnection(host);
  }

  void stopConnection() {
    _connectionService.stopConnection();
  }
}
