import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/icomoon_icons.dart';

class AmericanCosmoPayWall extends StatefulWidget {
  final void Function() onPrivacyTap;
  final void Function() onTermsTap;
  final void Function() subscribe;
  final void Function() onRestore;

  const AmericanCosmoPayWall(
      {super.key,
      required this.onPrivacyTap,
      required this.onTermsTap,
      required this.subscribe,
      required this.onRestore});

  @override
  State<AmericanCosmoPayWall> createState() => _AmericanCosmoPayWallState();
}

class _AmericanCosmoPayWallState extends State<AmericanCosmoPayWall> {
  late AssetImage image;

  @override
  void initState() {
    super.initState();
    image = const AssetImage("assets/images/am_cosmo.png");
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
            alignment: const Alignment(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 238,
                  child: Text(
                    S.of(context).blockScamAdsAndMakeYourWebSurfingSafe,
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                AmButton(
                  text: S.of(context).greatSecurity,
                  icon: Icomoon.globe,
                ),
                const SizedBox(
                  height: 12,
                ),
                AmButton(
                  text: S.of(context).activeAdsBlocker,
                  icon: Icomoon.shield,
                ),
                const SizedBox(
                  height: 12,
                ),
                AmButton(
                  text: S.of(context).safeVpnConnection,
                  icon: Icomoon.wifi,
                )
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).dayTrialFree,
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.76),
                    ),
                  ),
                  Text(
                    S.of(context).renewsCancelAnytime,
                    style: GoogleFonts.poppins().copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.76),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 64,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.black.withOpacity(0.65),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: widget.subscribe,
                        child: Text(
                          S.of(context).tryFreeBlockThreads,
                          style: GoogleFonts.poppins().copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 64),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: widget.onPrivacyTap,
                          child: Text(
                            S.of(context).privacyPolicy,
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white.withOpacity(0.76),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: widget.onPrivacyTap,
                          child: Text(
                            S.of(context).restorePurchase,
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white.withOpacity(0.76),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: widget.onTermsTap,
                          child: Text(
                            S.of(context).termsOfUse,
                            style: GoogleFonts.poppins().copyWith(
                              color: Colors.white.withOpacity(0.76),
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
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

class AmButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const AmButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 248,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(24),
        color: Colors.black.withOpacity(0.65),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                style: GoogleFonts.poppins().copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
