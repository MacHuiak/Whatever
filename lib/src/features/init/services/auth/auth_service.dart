

import 'package:fixnum/fixnum.dart' as fixnum;
import 'package:modern_vpn_project/generated/duration.pb.dart' as dur;
import 'package:modern_vpn_project/generated/account.pb.dart';
import 'package:modern_vpn_project/generated/account_service.pbgrpc.dart';
import 'package:modern_vpn_project/generated/auth_service.pbgrpc.dart';
import 'package:modern_vpn_project/src/features/init/services/auth/abstract_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AbstractAuthService {
  final SharedPreferences _sharedPreference;

  AuthRepositoryImpl(this._sharedPreference);

  @override
  String? get tokenGetter => _sharedPreference.getString("token");

  @override
  String? get password => _sharedPreference.getString("password");

  @override
  String? get userName => _sharedPreference.getString("userName");

  @override
  Future<void> tokenSaverFunction(String token) async {
    await _sharedPreference.setString("token", token);
  }

  @override
  Future<void> savePassword(String password) async {
    await _sharedPreference.setString("password", password);
  }

  @override
  Future<void> saveUserName(String userName) async {
    await _sharedPreference.setString("userName", userName);
  }
}


class CreateAccount extends AccountServiceClient {
  CreateAccount(super.channel);

  Future<Account?> create(
      {required String userName, required String password}) async {
    try {
      final request = CreateAccountRequest();
      final acc = Account();
      acc.username = userName;
      request.password = password;
      request.account = acc;
      request.subscriptionDuration =
          dur.Duration(seconds: fixnum.Int64(1800000000));
      final account = await createAccount(request);
      return account;
    } catch (error, stackTrace) {
      rethrow;
    }
  }
}

class UserLogin extends AuthServiceClient {
  final AuthRepositoryImpl _authRepository;

  UserLogin(super.channel, this._authRepository);

  Future<LoginResponse> logIn(
      {required String userName, required String password}) async {
    final request = LoginRequest();
    request.username = userName;
    request.password = password;

    final log = await login(request);
    await _authRepository.tokenSaverFunction(log.accessToken);
    return log;
  }
}