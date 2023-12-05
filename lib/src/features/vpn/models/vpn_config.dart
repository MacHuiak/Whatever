import 'package:modern_vpn_project/src/features/vpn/models/host.dart';

sealed class VPNConfig {}

class HostVPNConfig implements VPNConfig {
  final HostData host;

  HostVPNConfig({required this.host});

  @override
  bool operator ==(Object other) =>
      identical(this, other) &&
      other is HostVPNConfig &&
      runtimeType == other.runtimeType &&
      host == other.host;

  @override
  int get hashCode => host.hashCode;
}

class UserFileVPNConfig implements VPNConfig {
  final String configName;
  final String config;
  final String? login;
  final String? password;

  UserFileVPNConfig(
      {required this.configName,
      required this.config,
      this.login,
      this.password});

  @override
  bool operator ==(Object other) =>
      identical(this, other) &&
      other is UserFileVPNConfig &&
      runtimeType == other.runtimeType &&
      config == other.config;

  @override
  int get hashCode => Object.hashAll([config, config, login, password]);
}

extension UserConfigExtension on UserFileVPNConfig {
  String getConfigIp() {
    final ipRegexp = RegExp(r"remote .+");
    final match = ipRegexp.firstMatch(config);
    final ip = match?.group(0)?.split(" ")[1];
    return ip ?? "No data";
  }
}
