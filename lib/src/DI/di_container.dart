import 'package:modern_vpn_project/src/features/init/services/auth/auth_service.dart';
import 'package:modern_vpn_project/src/features/init/services/client_channel/client_channel.dart';
import 'package:modern_vpn_project/src/features/vpn/services/config_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/host_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/native_vpn_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/vpn_connection_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DI {
  DI._();

  static final _dependencies = <Type, Object>{};

  static final channelForClient =
      SingleChannelClient.factory("178.128.196.119", 9090);

  static Future<void> init(SharedPreferences sharedPreferences) async {
    _buildDependency(sharedPreferences);
  }

  static T getDependency<T>() => _dependencies[T] as T;

  static void _buildDependency(SharedPreferences sharedPreferences) {
    final auth = AuthRepositoryImpl(sharedPreferences);
    final host = HostService(channelForClient, auth);
    final createAccount = CreateAccount(channelForClient);
    final userLogin = UserLogin(channelForClient, auth);
    final configService = ConfigServiceImpl(channelForClient, auth);
    final connectionService = VpnConnectionService(
        configServiceImpl: configService, vpnService: IosVPNService());

    _dependencies[AuthRepositoryImpl] = auth;
    _dependencies[HostService] = host;
    _dependencies[CreateAccount] = createAccount;
    _dependencies[UserLogin] = userLogin;
    _dependencies[VpnConnectionService] = connectionService;

  }
}
