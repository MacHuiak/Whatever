import 'package:modern_vpn_project/src/features/init/services/auth/auth_service.dart';
import 'package:modern_vpn_project/src/features/init/services/client_channel/client_channel.dart';
import 'package:modern_vpn_project/src/features/password_manager/repository/password_repository.dart';
import 'package:modern_vpn_project/src/features/vpn/services/analitics_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/config_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/host_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/native_vpn_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/notification_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/payment_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/vpn_connection_service.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
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

  //PasswordRepository
  static void _buildDependency(SharedPreferences sharedPreferences) {
    final auth = AuthRepositoryImpl(sharedPreferences);
    final host = HostService(channelForClient, auth);
    final createAccount = CreateAccount(channelForClient);
    final userLogin = UserLogin(channelForClient, auth);
    final configService = ConfigServiceImpl(channelForClient, auth);
    final connectionService = VpnConnectionService(
        configServiceImpl: configService, vpnService: IosVPNService());
    final passwordRepository = PasswordRepository();
    final notificationService = NotificationServiceImpl();
final analyticsService =  AnalyticsServiceImpl();
    final paymentService = IOSPaymentServiceImpl(analyticsService: analyticsService, notificationService: notificationService);

    _dependencies[PasswordRepository] = passwordRepository;
    _dependencies[AuthRepositoryImpl] = auth;
    _dependencies[HostService] = host;
    _dependencies[CreateAccount] = createAccount;
    _dependencies[UserLogin] = userLogin;
    _dependencies[VpnConnectionService] = connectionService;
    _dependencies[SharedPreferences] = sharedPreferences;
    _dependencies[IOSPaymentServiceImpl] = paymentService;
    _dependencies[NotificationServiceImpl] = notificationService;
    _dependencies[AnalyticsServiceImpl]= analyticsService;
  }
}
