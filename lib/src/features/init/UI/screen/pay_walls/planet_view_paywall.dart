import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_vpn_project/generated/l10n.dart';

class PlanetVpnPayWall extends StatefulWidget {
  final void Function() onPrivacyTap;
  final void Function() onTermsTap;
  final void Function() subscribe;
  final void Function() onRestore;

  const PlanetVpnPayWall(
      {super.key,
      required this.onPrivacyTap,
      required this.onTermsTap,
      required this.subscribe,
      required this.onRestore});

  @override
  State<PlanetVpnPayWall> createState() => _PlanetVpnPayWallState();
}

class _PlanetVpnPayWallState extends State<PlanetVpnPayWall> {
  late AssetImage image;

  @override
  void initState() {
    super.initState();
    image = const AssetImage("assets/images/planet_background.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: image,
          ),
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
                    onTap: widget.subscribe,
                    child: SizedBox(
                      height: 60,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFA7FF9C).withAlpha(60),
                              blurRadius: 8.0,
                              spreadRadius: 4.0,
                            )
                          ],
                          border: Border.all(
                            color: const Color(0xFFC0FFB8),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 8.0,
                                  spreadRadius: 10.0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).activate.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins().copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: widget.onPrivacyTap,
                        child: Text(
                          S.of(context).privacyPolicy,
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 10,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onRestore,
                        child: Text(
                          S.of(context).restorePurchase,
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 10,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onTermsTap,
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
