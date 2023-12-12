import 'package:realm/realm.dart';
import 'dart:io';

// part "password_entity.g.dart";

@RealmModel()
class _PasswordEntity {
  @PrimaryKey()
  late int id;
  late String site;
  late String login;
  late String password;
}
