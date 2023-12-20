import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/feature_check_screen.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/pay_wall.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/screens/vpn_screen.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      if (false) {
        Get.to(() => const PayWall());
      } else {
        Get.offAll(() => const MainVPNScreen());
      }
      // context.router.replaceNamed('/mainVPN');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/Shield.svg",
              width: 256,
              height: 256,
            ),
            const Text(
              "Whatever VPN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
