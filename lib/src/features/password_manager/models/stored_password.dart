class StoredPassword {
  final String site;
  final String login;
  final String password;

  StoredPassword(
      {required this.site, required this.login, required this.password});

  @override
  bool operator ==(Object other) =>
      identical(this, other) &&
      other is StoredPassword &&
      runtimeType == other.runtimeType &&
          site == other.site;

  StoredPassword copyWith({String? site, String? login, String? password}) =>
      StoredPassword(
          site: site ?? this.site,
          login: login ?? this.login,
          password: password ?? this.password);

  @override
  int get hashCode => Object.hashAll([site, login, password]);
}
