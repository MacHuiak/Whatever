import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/pay_wall.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/splash_screen.dart';
import 'package:modern_vpn_project/src/features/init/services/auth/auth_service.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/screens/vpn_screen.dart';
import 'package:modern_vpn_project/src/features/vpn/services/analitics_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/notification_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/payment_service.dart';
import 'package:notification_permissions/notification_permissions.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {

  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://ef5995fa6963e683965be17816c8beff@o4506545843339264.ingest.sentry.io/4506545844453376';

      options.tracesSampleRate = 1.0;
    },
    appRunner: () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      final shared = await SharedPreferences.getInstance();
      RxSharedPreferences.getInstance();
      await DI.init(shared);
      runApp(
        const ProviderScope(
          child: VPN(),
        ),
      );
    },
  );
}

class VPN extends StatefulWidget  {

  const VPN({super.key});

  @override
  State<VPN> createState() => _VPNState();
}

class _VPNState extends State<VPN>  with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final firstInstall = DI.getDependency<SharedPreferences>().getBool("firstInstall")??true;
    if(firstInstall){
      DI.getDependency<SharedPreferences>().setBool("firstInstall",false);
      DI.getDependency<AnalyticsServiceImpl>().logEvent(AnalyticsEvent.install);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      NotificationPermissions.getNotificationPermissionStatus().then((value) {
        DI.getDependency<NotificationServiceImpl>().scheduleNotification();
      });
    }
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DI.getDependency<UserLogin>()
        .logIn(userName: "GalaxyNewUser", password: "newUser1907*!");
    DI.getDependency<IOSPaymentServiceImpl>().loadPurchases();
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        // 2
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          // 2
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: SplashScreen(),
      ),
    );
  }
}
