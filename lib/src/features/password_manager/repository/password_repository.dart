import 'dart:convert';

import 'package:modern_vpn_project/src/features/password_manager/models/stored_password.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

const String passwordKey = "password";

class PasswordRepository {
  final RxSharedPreferences rxSharedPreferences =
      RxSharedPreferences.getInstance();

  Stream<List<StoredPassword>?> get passwordStream =>
      rxSharedPreferences.getStringListStream(passwordKey).map((event) =>
          event?.map((e) => StoredPassword.fromJson(json.decode(e))).toList());

  Future<void> savePassword(StoredPassword newPassword) async {
    final savedPasswords = await rxSharedPreferences.getStringList(passwordKey);

    (savedPasswords ?? []).add(json.encode(newPassword.toJson()));
    rxSharedPreferences.setStringList(passwordKey, savedPasswords);
  }

  Future<void> deletePassword(StoredPassword removedPassword) async {
    final savedPasswords = await rxSharedPreferences.getStringList(passwordKey);
    List<StoredPassword> passwords = savedPasswords
            ?.map((e) => StoredPassword.fromJson(json.decode(e)))
            .toList() ??
        [];

    passwords.remove(removedPassword);
    rxSharedPreferences.setStringList(
        passwordKey, passwords.map((e) => json.encode(e.toJson())).toList());
  }
}
