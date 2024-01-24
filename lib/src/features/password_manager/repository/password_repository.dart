import 'dart:convert';

import 'package:modern_vpn_project/src/features/password_manager/models/stored_password.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

const String passwordKey = "password";

class PasswordRepository {
  final RxSharedPreferences rxSharedPreferences =
      RxSharedPreferences.getInstance();

  Stream<List<StoredPassword>?> get passwordStream {
   return rxSharedPreferences.getStringListStream(passwordKey).map((event) =>
        event?.map((e) => StoredPassword.fromJson(json.decode(e))).toList());
  }

  Future<void> savePassword(StoredPassword newPassword) async {
    final savedPasswords = await rxSharedPreferences.getStringList(passwordKey);

    final updatedPassword = (savedPasswords ?? [])..add(json.encode(newPassword.toJson()));
    rxSharedPreferences.setStringList(passwordKey, updatedPassword);
  }

  Future<void> deletePassword(StoredPassword removedPassword) async {
    final savedPasswords = await rxSharedPreferences.getStringList(passwordKey);
    List<StoredPassword> passwords = savedPasswords
            ?.map((e) => StoredPassword.fromJson(json.decode(e)))
            .toList() ??
        [];

    passwords = passwords..removeWhere((element) => element.password == removedPassword.password && element.login == removedPassword.login && element.site == removedPassword.site );
    rxSharedPreferences.setStringList(
        passwordKey, passwords.map((e) => json.encode(e.toJson())).toList());
  }
}
