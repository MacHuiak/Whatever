import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:modern_vpn_project/generated/l10n.dart';

class ColoredPaywall extends StatefulWidget {
  final void Function() onPrivacyTap;
  final void Function() onTermsTap;
  final void Function() subscribe;

  const ColoredPaywall(
      {super.key,
      required this.onPrivacyTap,
      required this.onTermsTap,
      required this.subscribe});

  @override
  State<ColoredPaywall> createState() => _ColoredPaywallState();
}

class _ColoredPaywallState extends State<ColoredPaywall> {
  int step = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(-1.6, -0.8),
            child: AnimatedContainer(
              width: 170,
              height: 170,
              duration: const Duration(milliseconds: 500),
              child: DecoratedBox(
                decoration:
                    BoxDecoration(color: _getColors(), shape: BoxShape.circle),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(1.5, 0.2),
            child: AnimatedContainer(
              width: 170,
              height: 170,
              decoration:
                  BoxDecoration(color: _getColors(), shape: BoxShape.circle),
              duration: const Duration(milliseconds: 500),
            ),
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 80,
                sigmaY: 80,
                tileMode: TileMode.mirror,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.65),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -.2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _getTitle(),
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 21,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.5)
                        ],
                        transform: const GradientRotation(pi / 4),
                      ),
                      width: 0.5,
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: 135,
                      height: 185,
                      child: _getImagePath(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                GestureDetector(
                  onTap: step == 3 ? widget.subscribe : null,
                  child: SizedBox(
                    width: 320,
                    child: Text(
                      _getText(),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins().copyWith(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 16),
              child: (step >= 1 && step <= 2)
                  ? GestureDetector(
                      onTap: () {
                        step = step - 1;
                      },
                      child: SizedBox(
                        width: 32,
                        height: 32,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.1),
                                  Colors.white.withOpacity(0.5)
                                ],
                                transform: const GradientRotation(pi / 4),
                              ),
                              width: 0.5,
                            ),
                          ),
                          child: Icon(
                            Icons.chevron_left_rounded,
                            color: Colors.white.withOpacity(0.6),
                            size: 24,
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      child: Text(
                        "Restore",
                        style: GoogleFonts.poppins().copyWith(
                            color: Colors.white.withOpacity(0.4), fontSize: 14),
                      ),
                    ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 16,
                  right: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 15,
                    child: step != 3
                        ? const SizedBox.shrink()
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  widget.onPrivacyTap();
                                },
                                child: Text(
                                  S.of(context).privacyPolicy,
                                  style: GoogleFonts.poppins().copyWith(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 11),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              GestureDetector(
                                onTap: () {
                                  widget.onTermsTap();
                                },
                                child: Text(
                                  S.of(context).termsOfUse,
                                  style: GoogleFonts.poppins().copyWith(
                                      color: Colors.white.withOpacity(0.4),
                                      fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      if(step ==3) {
                        widget.subscribe();
                      } else{
                        setState(() {
                          step = step +1;
                        });
                      }
                    },
                    child: const SizedBox(
                      height: 60,
                      child: Placeholder(),
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

  String _getTitle() {
    switch (step) {
      case 1:
        return "Ad blocking";
      case 2:
        return "Danger warning";
      case 3:
        return "Get Full Access";
      default:
        return "Ad blocking";
    }
  }

  String _getText() {
    switch (step) {
      case 1:
        return "Uses our ad blocking feature to remove ads on websites, pop-ups and distractions. Enjoy a cleaner web experience.";
      case 2:
        return "Stay protected from potentially dangerous phishing and scam sites";
      case 3:
        return "Get full access for 9.99\$ per WEEK. 3 DAYS Free Trial. Cancel subscription anytime";
      default:
        return "Uses our ad blocking feature to remove ads on websites, pop-ups and distractions. Enjoy a cleaner web experience.";
    }
  }

  Image _getImagePath() {
    switch (step) {
      case 1:
        return Image.asset("assets/images/neon_hand.png");

      case 2:
        return Image.asset("assets/images/neon_shield.png");

      case 3:
        return Image.asset("assets/images/neon_lock.png");

      default:
        return Image.asset("assets/images/neon_hand.png");
    }
  }

  Color _getColors() {
    switch (step) {
      case 1:
        return const Color(0xFFFF3C6B);
      case 2:
        return const Color(0xFF449AFF);
      case 3:
        return const Color(0xFF5CF64A);
      default:
        return const Color(0xFFFF3C6B);
    }
  }
}
