import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_vpn_project/generated/l10n.dart';

class CosmoPaywall extends StatefulWidget {
  final void Function() onPrivacyTap;
  final void Function() onTermsTap;
  final void Function() subscribe;
  final void Function() onRestore;

  const CosmoPaywall(
      {super.key,
      required this.onPrivacyTap,
      required this.onTermsTap,
      required this.subscribe,
      required this.onRestore});

  @override
  State<CosmoPaywall> createState() => _CosmoPaywallState();
}

class _CosmoPaywallState extends State<CosmoPaywall> {
  late AssetImage image;

  @override
  void initState() {
    super.initState();
    image = const AssetImage("assets/images/cosmo_background.png");
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
            alignment: const Alignment(0, -0.6),
            child: SizedBox(
              height: 143,
              width: 134,
              child: Image.asset("assets/images/galaxy_logo.png"),
            ),
          ),
          Align(
            alignment: Alignment(-1,-1),
            child: Padding(
              padding: const EdgeInsets.only(top: 48,left: 16),
              child: GestureDetector(
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
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 389,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  transform: GradientRotation(-1.6),
                  colors: [Colors.black, Colors.black, Colors.transparent],
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 348,
                  height: 366,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      transform: GradientRotation(-1.6),
                      colors: [Colors.black, Colors.transparent],
                    ),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: 120,
                        height: 60,
                        child: Image.asset("assets/images/planets.png"),
                      ),
                      SizedBox(
                        width: 220,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: S.of(context).galaxyvpnProtectionIs,
                            style: GoogleFonts.poppins().copyWith(
                              height: 1,
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            ),
                            children: [
                              TextSpan(
                                text: " ${S.of(context).ready} ",
                                style: GoogleFonts.comfortaa().copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20,
                                  color: const Color(0xFF5CF64A),
                                ),
                              ),
                              TextSpan(
                                text: S.of(context).toBeActivated,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        S.of(context).completeDatabase,
                        style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                      Text(
                        S.of(context).weeklyRegularUpdates,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: S.of(context).doYouWantTo,
                          style: GoogleFonts.poppins().copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                              text: " ${S.of(context).activate} ",
                              style: GoogleFonts.comfortaa().copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                color: const Color(0xFF5CF64A),
                              ),
                            ),
                            TextSpan(
                              text: S.of(context).it,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: widget.subscribe,
                        child: SizedBox(
                          width: 298,
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
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
                          onTap: widget.subscribe,
                          child: Text(
                            S.of(context).getFullAccessFor999Weekly,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins().copyWith(
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: Row(
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
