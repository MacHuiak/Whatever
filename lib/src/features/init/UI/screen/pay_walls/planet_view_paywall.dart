import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_vpn_project/generated/l10n.dart';

class PlanetVpnPayWall extends StatelessWidget {
  final void Function() onPrivacyTap;
  final void Function() onTermsTap;
  final void Function() subscribe;

  const PlanetVpnPayWall(
      {super.key,
      required this.onPrivacyTap,
      required this.onTermsTap,
      required this.subscribe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/planet_background.png"),
          Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 64.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).getFull,
                    style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                  Text(
                    S.of(context).protection,
                    style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    S.of(context).getFullAccessFor999Weekly,
                    style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                  Text(
                    S.of(context).anotherFreeTrial,
                    style: GoogleFonts.poppins().copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 12,
                  right: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: subscribe,
                    child: const SizedBox(
                      height: 51,
                      child: Placeholder(),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: onPrivacyTap,
                        child: Text(
                          S.of(context).privacyPolicy,
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 10,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Text(
                        S.of(context).restorePurchase,
                        style: GoogleFonts.poppins().copyWith(
                          fontSize: 10,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      GestureDetector(
                        onTap: onTermsTap,
                        child: Text(
                          S.of(context).termsOfUse,
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 10,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}