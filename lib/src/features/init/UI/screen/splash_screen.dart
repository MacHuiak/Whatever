import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/feature_check_screen.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/pay_wall.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/screens/vpn_screen.dart';
import 'package:modern_vpn_project/src/features/vpn/logics/subscription/subscription.dart';
import 'package:modern_vpn_project/src/features/vpn/services/notification_service.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();



    // ref.watch(subscriptionStatusController).maybeWhen(orElse: () {
    //   log("");
    // }, error: (_, err) {
    //   log("");
    // }, data: (bool? haveSubscription) {
    //   if (haveSubscription ?? false) {
    //     Get.offAll(() => const MainVPNScreen());
    //   } else {
    //     Get.offAll(() => const PayWall());
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(subscriptionStatusController, (previous, next) {
      if (previous?.value !=null || (next.value !=null)) {
        Get.offAll(() => const MainVPNScreen());
      } else {
        Get.offAll(() => const PayWall());
      }
    });
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
