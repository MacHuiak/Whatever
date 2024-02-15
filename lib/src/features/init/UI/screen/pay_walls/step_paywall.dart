import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_vpn_project/generated/l10n.dart';

class StepPayWall extends StatefulWidget {
  final void Function() onPrivacyTap;
  final void Function() onTermsTap;
  final void Function() subscribe;

  const StepPayWall(
      {super.key,
      required this.onPrivacyTap,
      required this.onTermsTap,
      required this.subscribe});

  @override
  State<StepPayWall> createState() => _StepPayWallState();
}

class _StepPayWallState extends State<StepPayWall> {
  int step = 1;
  bool subscribeStatus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leadingWidth: subscribeStatus ? 100 : null,
        leading: subscribeStatus
            ? TextButton(
                onPressed: () {},
                child: Text(
                  S.of(context).restore,
                  style: GoogleFonts.poppins().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
              )
            : step > 1
                ? InkWell(
                    onTap: () {
                      setState(() {
                        step = step - 1;
                      });
                    },
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  )
                : const SizedBox(),
      ),
      body: subscribeStatus
          ? Stack(
              children: [
                Align(
                  alignment: const Alignment(0, -0.8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 248,
                        height: 248,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          "assets/images/shield_2.png",
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      SizedBox(
                        width: 178,
                        child: Text(
                          S.of(context).getCompleteProtection,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 33,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              S.of(context).getFullAccess,
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              S.of(context).dayTrial,
                              style: GoogleFonts.poppins().copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.subscribe();
                        },
                        child: const SizedBox(
                            width: 250, height: 68, child: Placeholder()),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).padding.bottom),
                        child: SizedBox(
                          width: 280,
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
                              Container(
                                width: 2,
                                height: 2,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                              Text(
                                S.of(context).restorePurchase,
                                style: GoogleFonts.poppins().copyWith(
                                  fontSize: 10,
                                  color: Colors.white,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 2,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
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
                    ],
                  ),
                )
              ],
            )
          : Stack(
              children: [
                Align(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 248,
                        height: 248,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          _getImagePath(),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Text(
                        _getTitle(),
                        style: GoogleFonts.poppins().copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48.0),
                        child: Text(
                          _getBody(),
                          style: GoogleFonts.poppins().copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 1),
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom,
                        left: 24,
                        right: 24),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {
                              if (step == 3) {
                                setState(() {
                                  subscribeStatus = true;
                                });
                              } else {
                                setState(() {
                                  step = step + 1;
                                });
                              }
                            },
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  S.of(context).next,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Flexible(
                          flex: 8,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                subscribeStatus = true;
                              });
                            },
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border:
                                    Border.all(color: Colors.white, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  S.of(context).subscribe,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            ),
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

  String _getBody() {
    switch (step) {
      case 1:
        return S.of(context).protectOnline;
      case 2:
        return S.of(context).increaseComfort;
      case 3:
        return S.of(context).stayProtected;
      default:
        return S.of(context).protectOnline;
    }
  }

  String _getTitle() {
    switch (step) {
      case 1:
        return S.of(context).blockUserTracking;
      case 2:
        return S.of(context).blockAds;
      case 3:
        return S.of(context).dangerWarnings;
      default:
        return S.of(context).blockUserTracking;
    }
  }

  String _getImagePath() {
    switch (step) {
      case 1:
        return "assets/images/lock.png";
      case 2:
        return "assets/images/column.png";
      case 3:
        return "assets/images/warning.png";
      default:
        return "assets/images/lock.png";
    }
  }
}
