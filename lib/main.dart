import 'package:flutter/material.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  final shared = await SharedPreferences.getInstance();
  DI.init(shared);
  runApp(VPN());
}

class VPN extends StatelessWidget {
  final _appRouter = AppRouter();

  VPN({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
