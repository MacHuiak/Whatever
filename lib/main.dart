import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:get/get_core/get_core.dart';
// import 'package:get/instance_manager.dart';
// import 'package:hive/hive.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  final shared = await SharedPreferences.getInstance();
  DI.init(shared);
  // var path = Directory.current.path;
  // Hive.init(path);
  // Get.lazyPut<bool>(()=>true);
  runApp(VPN());
}

class VPN extends StatelessWidget {
  final _appRouter = AppRouter();

  VPN({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MaterialApp.router(
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
