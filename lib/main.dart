import 'dart:io';

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
import 'package:modern_vpn_project/src/router.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // runApp(const MyApp());

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
}

class VPN extends StatelessWidget {
  final _appRouter = AppRouter();

  VPN({super.key});

  @override
  Widget build(BuildContext context) {
    DI
        .getDependency<UserLogin>()
        .logIn(userName: "GalaxyNewUser", password: "newUser1907*!");
    return GetMaterialApp(
      localizationsDelegates: const [
        S.delegate,
        // 2
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MaterialApp.router(
        localizationsDelegates: [
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
