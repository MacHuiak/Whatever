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
  String get activateCapital {
    return Intl.message(
      'ACTIVATE',
      name: 'activateCapital',
      desc: '',
      args: [],
    );
  }

  /// `Restore`
  String get restoreCapital {
    return Intl.message(
      'Restore',
      name: 'restoreCapital',
      desc: '',
      args: [],
    );
  }

  /// `Ensure Security!`
  String get ensureSecurity {
    return Intl.message(
      'Ensure Security!',
      name: 'ensureSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Tap to Activate the VPN and Safeguard Your Data from Hackers and Snoops!`
  String get ensureSecurityBody {
    return Intl.message(
      'Tap to Activate the VPN and Safeguard Your Data from Hackers and Snoops!',
      name: 'ensureSecurityBody',
      desc: '',
      args: [],
    );
  }

  /// `Guard Your Privacy!`
  String get guardYourPrivacy {
    return Intl.message(
      'Guard Your Privacy!',
      name: 'guardYourPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Shield Your Online Identity - Open the VPN Now!`
  String get guardYourPrivacyBody {
    return Intl.message(
      'Shield Your Online Identity - Open the VPN Now!',
      name: 'guardYourPrivacyBody',
      desc: '',
      args: [],
    );
  }

  /// `Alert: Unsecured Wi-Fi!`
  String get alertUnsecuredWifi {
    return Intl.message(
      'Alert: Unsecured Wi-Fi!',
      name: 'alertUnsecuredWifi',
      desc: '',
      args: [],
    );
  }

  /// `Tap Here to Activate the VPN and Encrypt Your Connection.`
  String get alertUnsecuredWifiBody {
    return Intl.message(
      'Tap Here to Activate the VPN and Encrypt Your Connection.',
      name: 'alertUnsecuredWifiBody',
      desc: '',
      args: [],
    );
  }

  /// `Public Network Warning!`
  String get publicNetworkWarning {
    return Intl.message(
      'Public Network Warning!',
      name: 'publicNetworkWarning',
      desc: '',
      args: [],
    );
  }

  /// `Enable VPN to Safeguard Your Personal Information.`
  String get publicNetworkWarningBody {
    return Intl.message(
      'Enable VPN to Safeguard Your Personal Information.',
      name: 'publicNetworkWarningBody',
      desc: '',
      args: [],
    );
  }

  /// `VPN Alert`
  String get vpnAlert {
    return Intl.message(
      'VPN Alert',
      name: 'vpnAlert',
      desc: '',
      args: [],
    );
  }

  /// `Maintain Privacy and Safety - Tap to Connect!`
  String get vpnAlertBody {
    return Intl.message(
      'Maintain Privacy and Safety - Tap to Connect!',
      name: 'vpnAlertBody',
      desc: '',
      args: [],
    );
  }

  /// `Beware of Hackers!`
  String get bewareOfHackersBody {
    return Intl.message(
      'Beware of Hackers!',
      name: 'bewareOfHackersBody',
      desc: '',
      args: [],
    );
  }

  /// `Open the VPN to Defend Against Cyber Threats!`
  String get bewareOfHackers {
    return Intl.message(
      'Open the VPN to Defend Against Cyber Threats!',
      name: 'bewareOfHackers',
      desc: '',
      args: [],
    );
  }

  /// `Your Data is Vulnerable!`
  String get yourDataIsVulnerable {
    return Intl.message(
      'Your Data is Vulnerable!',
      name: 'yourDataIsVulnerable',
      desc: '',
      args: [],
    );
  }

  /// `Tap to Activate VPN and Remain Anonymous Online.`
  String get yourDataIsVulnerableBody {
    return Intl.message(
      'Tap to Activate VPN and Remain Anonymous Online.',
      name: 'yourDataIsVulnerableBody',
      desc: '',
      args: [],
    );
  }

  /// `Prioritize Privacy!`
  String get prioritizePrivacy {
    return Intl.message(
      'Prioritize Privacy!',
      name: 'prioritizePrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Open VPN for Secure Internet Browsing.`
  String get prioritizePrivacyBody {
    return Intl.message(
      'Open VPN for Secure Internet Browsing.',
      name: 'prioritizePrivacyBody',
      desc: '',
      args: [],
    );
  }

  /// `Secure Your Online Footprint!`
  String get secureYourOnlineFootprint {
    return Intl.message(
      'Secure Your Online Footprint!',
      name: 'secureYourOnlineFootprint',
      desc: '',
      args: [],
    );
  }

  /// `Tap to Enable VPN and Shield Yourself.`
  String get secureYourOnlineFootprintBody {
    return Intl.message(
      'Tap to Enable VPN and Shield Yourself.',
      name: 'secureYourOnlineFootprintBody',
      desc: '',
      args: [],
    );
  }

  /// `VPN On-the-Go`
  String get vpnOnthego {
    return Intl.message(
      'VPN On-the-Go',
      name: 'vpnOnthego',
      desc: '',
      args: [],
    );
  }

  /// `Boost Your Privacy by Tapping to Connect!`
  String get vpnOnthegoBody {
    return Intl.message(
      'Boost Your Privacy by Tapping to Connect!',
      name: 'vpnOnthegoBody',
      desc: '',
      args: [],
    );
  }

  /// `• Full database of suspicious websites`
  String get full_base {
    return Intl.message(
      '• Full database of suspicious websites',
      name: 'full_base',
      desc: '',
      args: [],
    );
  }

  /// `• Weekly updates to ensure proper protection`
  String get security {
    return Intl.message(
      '• Weekly updates to ensure proper protection',
      name: 'security',
      desc: '',
      args: [],
    );
  }

  /// `• Modern technologies for providing the best service`
  String get best_service {
    return Intl.message(
      '• Modern technologies for providing the best service',
      name: 'best_service',
      desc: '',
      args: [],
    );
  }

  /// `Get Complete Protection`
  String get getCompleteProtection {
    return Intl.message(
      'Get Complete Protection',
      name: 'getCompleteProtection',
      desc: '',
      args: [],
    );
  }

  /// `Get full access for 9.99 $ per WEEK.`
  String get getFullAccess {
    return Intl.message(
      'Get full access for 9.99 \$ per WEEK.',
      name: 'getFullAccess',
      desc: '',
      args: [],
    );
  }

  /// `3 DAY free trial. Cancel the subscription at any moment`
  String get dayTrial {
    return Intl.message(
      '3 DAY free trial. Cancel the subscription at any moment',
      name: 'dayTrial',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Restore Purchase`
  String get restorePurchase {
    return Intl.message(
      'Restore Purchase',
      name: 'restorePurchase',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Protect your privacy online! Prevent websites from collecting your data without consent. Take control of your fingerprint.`
  String get protectOnline {
    return Intl.message(
      'Protect your privacy online! Prevent websites from collecting your data without consent. Take control of your fingerprint.',
      name: 'protectOnline',
      desc: '',
      args: [],
    );
  }

  /// `Increase your comfort and browsing speed! Uses our ad blocking feature to remove ads on websites, pop-ups and distractions. Enjoy a cleaner web experience.`
  String get increaseComfort {
    return Intl.message(
      'Increase your comfort and browsing speed! Uses our ad blocking feature to remove ads on websites, pop-ups and distractions. Enjoy a cleaner web experience.',
      name: 'increaseComfort',
      desc: '',
      args: [],
    );
  }

  /// `Stay protected from potentially dangerous phishing and scam sites.`
  String get stayProtected {
    return Intl.message(
      'Stay protected from potentially dangerous phishing and scam sites.',
      name: 'stayProtected',
      desc: '',
      args: [],
    );
  }

  /// `Block user tracking`
  String get blockUserTracking {
    return Intl.message(
      'Block user tracking',
      name: 'blockUserTracking',
      desc: '',
      args: [],
    );
  }

  /// `Block ads`
  String get blockAds {
    return Intl.message(
      'Block ads',
      name: 'blockAds',
      desc: '',
      args: [],
    );
  }

  /// `Danger warnings`
  String get dangerWarnings {
    return Intl.message(
      'Danger warnings',
      name: 'dangerWarnings',
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

  /// `3 Days Free Trial. Cancel subscription anytime`
  String get anotherFreeTrial {
    return Intl.message(
      '3 Days Free Trial. Cancel subscription anytime',
      name: 'anotherFreeTrial',
      desc: '',
      args: [],
    );
  }

  /// `Get full access for $9.99 weekly`
  String get getFullAccessFor999Weekly {
    return Intl.message(
      'Get full access for \$9.99 weekly',
      name: 'getFullAccessFor999Weekly',
      desc: '',
      args: [],
    );
  }

  /// `Protection`
  String get protection {
    return Intl.message(
      'Protection',
      name: 'protection',
      desc: '',
      args: [],
    );
  }

  /// `Get Full`
  String get getFull {
    return Intl.message(
      'Get Full',
      name: 'getFull',
      desc: '',
      args: [],
    );
  }

  /// `Web surfing protection`
  String get webSurfingProtection {
    return Intl.message(
      'Web surfing protection',
      name: 'webSurfingProtection',
      desc: '',
      args: [],
    );
  }

  /// `This application makes your web surfing safe and private. Forget about leaking your personal data and create your own blacklist if necessary.`
  String get surfingSafe {
    return Intl.message(
      'This application makes your web surfing safe and private. Forget about leaking your personal data and create your own blacklist if necessary.',
      name: 'surfingSafe',
      desc: '',
      args: [],
    );
  }

  /// `Ad blocking`
  String get adBlocking {
    return Intl.message(
      'Ad blocking',
      name: 'adBlocking',
      desc: '',
      args: [],
    );
  }

  /// `Whatever VPN blocks 95% of all advertising on the Internet and makes page loading 30% faster`
  String get advertisingOnTheInternetAnd {
    return Intl.message(
      'Whatever VPN blocks 95% of all advertising on the Internet and makes page loading 30% faster',
      name: 'advertisingOnTheInternetAnd',
      desc: '',
      args: [],
    );
  }

  /// `Danger warning`
  String get dangerWarning {
    return Intl.message(
      'Danger warning',
      name: 'dangerWarning',
      desc: '',
      args: [],
    );
  }

  /// `Stay protected from potentially dangerous phishing and scam sites`
  String get phishingAndScamSites {
    return Intl.message(
      'Stay protected from potentially dangerous phishing and scam sites',
      name: 'phishingAndScamSites',
      desc: '',
      args: [],
    );
  }

  /// `ready`
  String get ready {
    return Intl.message(
      'ready',
      name: 'ready',
      desc: '',
      args: [],
    );
  }

  /// `Whatever VPN protection is`
  String get galaxyvpnProtectionIs {
    return Intl.message(
      'Whatever VPN protection is',
      name: 'galaxyvpnProtectionIs',
      desc: '',
      args: [],
    );
  }

  /// `to be activated`
  String get toBeActivated {
    return Intl.message(
      'to be activated',
      name: 'toBeActivated',
      desc: '',
      args: [],
    );
  }

  /// `-complete database of high risk sites.`
  String get completeDatabase {
    return Intl.message(
      '-complete database of high risk sites.',
      name: 'completeDatabase',
      desc: '',
      args: [],
    );
  }

  /// `-weekly regular updates for full protection.`
  String get weeklyRegularUpdates {
    return Intl.message(
      '-weekly regular updates for full protection.',
      name: 'weeklyRegularUpdates',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to`
  String get doYouWantTo {
    return Intl.message(
      'Do you want to',
      name: 'doYouWantTo',
      desc: '',
      args: [],
    );
  }

  /// `activate`
  String get activate {
    return Intl.message(
      'activate',
      name: 'activate',
      desc: '',
      args: [],
    );
  }

  /// `it?`
  String get it {
    return Intl.message(
      'it?',
      name: 'it',
      desc: '',
      args: [],
    );
  }

  /// `3-day trial free`
  String get dayTrialFree {
    return Intl.message(
      '3-day trial free',
      name: 'dayTrialFree',
      desc: '',
      args: [],
    );
  }

  /// `Safe VPN connection`
  String get safeVpnConnection {
    return Intl.message(
      'Safe VPN connection',
      name: 'safeVpnConnection',
      desc: '',
      args: [],
    );
  }

  /// `Active Ads Blocker`
  String get activeAdsBlocker {
    return Intl.message(
      'Active Ads Blocker',
      name: 'activeAdsBlocker',
      desc: '',
      args: [],
    );
  }

  /// `Great Security`
  String get greatSecurity {
    return Intl.message(
      'Great Security',
      name: 'greatSecurity',
      desc: '',
      args: [],
    );
  }

  /// `BLOCK SCAM ADS AND MAKE YOUR WEB SURFING SAFE!`
  String get blockScamAdsAndMakeYourWebSurfingSafe {
    return Intl.message(
      'BLOCK SCAM ADS AND MAKE YOUR WEB SURFING SAFE!',
      name: 'blockScamAdsAndMakeYourWebSurfingSafe',
      desc: '',
      args: [],
    );
  }

  /// `Renews at $9.99/week. Cancel anytime.`
  String get renewsCancelAnytime {
    return Intl.message(
      'Renews at \$9.99/week. Cancel anytime.',
      name: 'renewsCancelAnytime',
      desc: '',
      args: [],
    );
  }

  /// `Try Free & Block Threads`
  String get tryFreeBlockThreads {
    return Intl.message(
      'Try Free & Block Threads',
      name: 'tryFreeBlockThreads',
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
