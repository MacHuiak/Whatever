import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


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
    //TODO: add get host

    //TODO: add navigation to main screen
    // Future.delayed(const Duration(seconds: 1)).whenComplete(() => null)
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Sv
          Text("VPN", style: TextStyle(
              color: Colors.white,
              fontSize: 18
          ),),
        ],
      ),
    );
  }
}
