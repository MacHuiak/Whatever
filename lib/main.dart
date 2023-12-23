import 'dart:io';

//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
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/generated/l10n.dart';

// import 'package:get/get_core/get_core.dart';
// import 'package:get/instance_manager.dart';
// import 'package:hive/hive.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/features/init/services/auth/auth_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/analitics_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/notification_service.dart';
import 'package:modern_vpn_project/src/features/vpn/services/payment_service.dart';
import 'package:modern_vpn_project/src/router.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // runApp(const MyApp());

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://9e86aab27e060a430c35a4ffc2ad2f39@o4506392320344064.ingest.sentry.io/4506393143148544';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () async {
      WidgetsFlutterBinding.ensureInitialized();
      final shared = await SharedPreferences.getInstance();
      RxSharedPreferences.getInstance();
      await DI.init(shared);
      // var path = Directory.current.path;
      // Hive.init(path);
      // Get.lazyPut<bool>(()=>true);
      runApp(
        ProviderScope(
          child: VPN(),
        ),
      );
    },
  );
}

class VPN extends StatelessWidget {
  final _appRouter = AppRouter();

  VPN({super.key});

  @override
  Widget build(BuildContext context) {
    DI
        .getDependency<UserLogin>()
        .logIn(userName: "GalaxyNewUser", password: "newUser1907*!");
    IOSPaymentServiceImpl().loadPurchases();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        // 2
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          // 2
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
