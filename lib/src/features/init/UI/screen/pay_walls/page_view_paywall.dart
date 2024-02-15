import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_vpn_project/generated/l10n.dart';

class PageViewPayWall extends StatefulWidget {
  final void Function() onPrivacyTap;
  final void Function() onTermsTap;
  final void Function() subscribe;

  const PageViewPayWall(
      {super.key,
      required this.onPrivacyTap,
      required this.onTermsTap,
      required this.subscribe});

  @override
  State<PageViewPayWall> createState() => _PageViwePayWallState();
}

class _PageViwePayWallState extends State<PageViewPayWall> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/galaxy_background.png"),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
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
            alignment: const Alignment(0, -0.4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 550,
                  child: PageView(
                    children: [
                      PayWallPage(
                        path: "assets/images/shield_in_circle.png",
                        title: S.of(context).webSurfingProtection,
                        body: S.of(context).surfingSafe,
                      ),
                      PayWallPage(
                        path: "assets/images/column_in_circle.png",
                        title: S.of(context).adBlocking,
                        body: S.of(context).advertisingOnTheInternetAnd,
                      ),
                      PayWallPage(
                        path: "assets/images/warn_in_circle.png",
                        title: S.of(context).dangerWarning,
                        body: S.of(context).phishingAndScamSites,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 22,
                      height: 4,
                      decoration: BoxDecoration(
                        color: true
                            ? const Color(0xFF5FA857)
                            : Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 22,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 22,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: const Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 250, height: 68, child: Placeholder()),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  S.of(context).getFullAccessFor999Weekly,
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 12,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
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
                              color: Colors.white, shape: BoxShape.circle),
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
                              color: Colors.white, shape: BoxShape.circle),
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
      ),
    );
  }
}

class PayWallPage extends StatelessWidget {
  final String path;
  final String title;
  final String body;

  const PayWallPage({
    super.key,
    required this.path,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 206,
          height: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins()
                .copyWith(fontSize: 26, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        SizedBox(
          height: 238,
          width: 238,
          child: Image.asset(path),
        ),
        const SizedBox(
          height: 36,
        ),
        SizedBox(
          width: 318,
          child: Text(
            body,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins().copyWith(
                fontSize: 13, color: Colors.white, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}
