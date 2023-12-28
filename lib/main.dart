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
import 'package:modern_vpn_project/src/features/vpn/services/payment_service.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://9e86aab27e060a430c35a4ffc2ad2f39@o4506392320344064.ingest.sentry.io/4506393143148544';
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

class VPN extends StatelessWidget {

  const VPN({super.key});

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
        home: PayWall(),
      ),
    );
  }
}
