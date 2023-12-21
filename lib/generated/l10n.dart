// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Site`
  String get site {
    return Intl.message(
      'Site',
      name: 'site',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Add new`
  String get addNew {
    return Intl.message(
      'Add new',
      name: 'addNew',
      desc: '',
      args: [],
    );
  }

  /// `Use`
  String get use {
    return Intl.message(
      'Use',
      name: 'use',
      desc: '',
      args: [],
    );
  }

  /// `«Add new» \n`
  String get addNewN {
    return Intl.message(
      '«Add new» \n',
      name: 'addNewN',
      desc: '',
      args: [],
    );
  }

  /// `to add new password`
  String get toAddNewPassword {
    return Intl.message(
      'to add new password',
      name: 'toAddNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password manager`
  String get passwordManager {
    return Intl.message(
      'Password manager',
      name: 'passwordManager',
      desc: '',
      args: [],
    );
  }

  /// `Copied`
  String get copied {
    return Intl.message(
      'Copied',
      name: 'copied',
      desc: '',
      args: [],
    );
  }

  /// `Disconnect`
  String get disconnect {
    return Intl.message(
      'Disconnect',
      name: 'disconnect',
      desc: '',
      args: [],
    );
  }

  /// `Try again`
  String get tryAgain {
    return Intl.message(
      'Try again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `the light saber to connect VPN`
  String get theLightSaberToConnectVpn {
    return Intl.message(
      'the light saber to connect VPN',
      name: 'theLightSaberToConnectVpn',
      desc: '',
      args: [],
    );
  }

  /// `Click and drag`
  String get clickAndDrag {
    return Intl.message(
      'Click and drag',
      name: 'clickAndDrag',
      desc: '',
      args: [],
    );
  }

  /// `Fastest Server`
  String get fastestServer {
    return Intl.message(
      'Fastest Server',
      name: 'fastestServer',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Add user config`
  String get addUserConfig {
    return Intl.message(
      'Add user config',
      name: 'addUserConfig',
      desc: '',
      args: [],
    );
  }

  /// `Drag sword to start \nVPN connection`
  String get dragSwordToStartNvpnConnection {
    return Intl.message(
      'Drag sword to start \nVPN connection',
      name: 'dragSwordToStartNvpnConnection',
      desc: '',
      args: [],
    );
  }

  /// `Cancel connection`
  String get cancelConnection {
    return Intl.message(
      'Cancel connection',
      name: 'cancelConnection',
      desc: '',
      args: [],
    );
  }

  /// `Sydney (Australia)`
  String get australia {
    return Intl.message(
      'Sydney (Australia)',
      name: 'australia',
      desc: '',
      args: [],
    );
  }

  /// `Bangalore (India)`
  String get India {
    return Intl.message(
      'Bangalore (India)',
      name: 'India',
      desc: '',
      args: [],
    );
  }

  /// `Frankfurt (Germany)`
  String get Germany {
    return Intl.message(
      'Frankfurt (Germany)',
      name: 'Germany',
      desc: '',
      args: [],
    );
  }

  /// `London (UK)`
  String get Uk {
    return Intl.message(
      'London (UK)',
      name: 'Uk',
      desc: '',
      args: [],
    );
  }

  /// `Singapore`
  String get Singapore {
    return Intl.message(
      'Singapore',
      name: 'Singapore',
      desc: '',
      args: [],
    );
  }

  /// `New York (USA)`
  String get Usa {
    return Intl.message(
      'New York (USA)',
      name: 'Usa',
      desc: '',
      args: [],
    );
  }

  /// `Amsterdam (Netherlands)`
  String get Netherlands {
    return Intl.message(
      'Amsterdam (Netherlands)',
      name: 'Netherlands',
      desc: '',
      args: [],
    );
  }

  /// `Toronto (Canada)`
  String get Canada {
    return Intl.message(
      'Toronto (Canada)',
      name: 'Canada',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown {
    return Intl.message(
      'Unknown',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `Rate our app and may the force be with you`
  String get rateText {
    return Intl.message(
      'Rate our app and may the force be with you',
      name: 'rateText',
      desc: '',
      args: [],
    );
  }

  /// `Rate App`
  String get rateButton {
    return Intl.message(
      'Rate App',
      name: 'rateButton',
      desc: '',
      args: [],
    );
  }

  /// `Spam filter`
  String get spamFilter {
    return Intl.message(
      'Spam filter',
      name: 'spamFilter',
      desc: '',
      args: [],
    );
  }

  /// `Protects your smartphone from spam advertising activity`
  String get spamFilterBody {
    return Intl.message(
      'Protects your smartphone from spam advertising activity',
      name: 'spamFilterBody',
      desc: '',
      args: [],
    );
  }

  /// `Phishing filter`
  String get phishingFilter {
    return Intl.message(
      'Phishing filter',
      name: 'phishingFilter',
      desc: '',
      args: [],
    );
  }

  /// `Protects your smartphone stealing your banking and personal data`
  String get phisingFilterBody {
    return Intl.message(
      'Protects your smartphone stealing your banking and personal data',
      name: 'phisingFilterBody',
      desc: '',
      args: [],
    );
  }

  /// `Adware filter`
  String get adwareFilter {
    return Intl.message(
      'Adware filter',
      name: 'adwareFilter',
      desc: '',
      args: [],
    );
  }

  /// `Protects your smartphone from a bad site activity`
  String get adwareFilterBody {
    return Intl.message(
      'Protects your smartphone from a bad site activity',
      name: 'adwareFilterBody',
      desc: '',
      args: [],
    );
  }

  /// `Cryptominers filter`
  String get cryptominersFilter {
    return Intl.message(
      'Cryptominers filter',
      name: 'cryptominersFilter',
      desc: '',
      args: [],
    );
  }

  /// `Help to prevent using resourses of your smartphone for mining cryptocurrency`
  String get cryptominersFilterBody {
    return Intl.message(
      'Help to prevent using resourses of your smartphone for mining cryptocurrency',
      name: 'cryptominersFilterBody',
      desc: '',
      args: [],
    );
  }

  /// `ACTIVATE`
  String get activate {
    return Intl.message(
      'ACTIVATE',
      name: 'activate',
      desc: '',
      args: [],
    );
  }

  /// `Restore`
  String get restore {
    return Intl.message(
      'Restore',
      name: 'restore',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
