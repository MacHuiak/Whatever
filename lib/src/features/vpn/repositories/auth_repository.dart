



abstract class AbstractAuthRepository {
  String? get tokenGetter;

  String? get userName;

  String? get password;

  Future<void> tokenSaverFunction(String token);

  Future<void> saveUserName(String userName);

  Future<void> savePassword(String password);
}
