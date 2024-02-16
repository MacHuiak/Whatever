import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/pay_walls/american_paywall.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/pay_walls/colored_paywall.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/pay_walls/galaxy_paywall.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/pay_walls/page_view_paywall.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/pay_walls/planet_view_paywall.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/pay_walls/step_paywall.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/screens/info_screen.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/screens/vpn_screen.dart';
import 'package:modern_vpn_project/src/features/vpn/logics/subscription/subscription.dart';
import 'package:modern_vpn_project/src/features/vpn/services/firebase_remote_config_service.dart';
import 'package:modern_vpn_project/src/in_app_extension.dart';

class TutorialOverlay extends ModalRoute<void> {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => "overlay";

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CupertinoActivityIndicator(
            radius: 20,
          )
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}

class PayWall extends ConsumerStatefulWidget {
  const PayWall({super.key});

  @override
  ConsumerState<PayWall> createState() => _PayWallState();
}

class _PayWallState extends ConsumerState<PayWall> {
  late int step;

  @override
  void initState() {
    super.initState();

    step = DI.getDependency<FirebaseRemoteConfigService>().getPaywallType();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(subscriptionStatusController, (previous, next) {
      Navigator.of(context).pop();
      if (previous?.value != null || (next.value != null)) {
        Get.offAll(() => const MainVPNScreen());
      }
    });

    switch (step) {
      case 2:
        return AmericanGalaxyPayWall(
          onPrivacyTap: onPrivacyTap,
          onTermsTap: onTermsTap,
          subscribe: buySubscription,
        );
      case 3:
        return GalaxyPaywall(
          onPrivacyTap: onPrivacyTap,
          onTermsTap: onTermsTap,
          subscribe: buySubscription,
        );
      case 4:
        return PlanetVpnPayWall(
          onPrivacyTap: onPrivacyTap,
          onTermsTap: onTermsTap,
          subscribe: buySubscription,
        );
      case 5:
        return StepPayWall(
          onPrivacyTap: onPrivacyTap,
          onTermsTap: onTermsTap,
          subscribe: buySubscription,
        );
      case 6:
        return PageViewPayWall(
          onPrivacyTap: onPrivacyTap,
          onTermsTap: onTermsTap,
          subscribe: buySubscription,
        );
      case 7:
        return ColoredPaywall(
          onPrivacyTap: onPrivacyTap,
          onTermsTap: onTermsTap,
          subscribe: buySubscription,
        );
      case 1:
        return const FirstPayWall();
      default:
        return const FirstPayWall();
    }
  }

  onTermsTap() {
    Get.to(
      () => const InfoScreen(title: "Terms of Use", infoType: InfoType.terms),
    );
  }

  onPrivacyTap() {
    Get.to(
      () =>
          const InfoScreen(title: "Privacy Policy", infoType: InfoType.privacy),
    );
  }

  buySubscription() {
    HapticFeedback.vibrate();

    ref.read(subscriptionStatusController.notifier).buySubscription();
    Navigator.of(context).push(TutorialOverlay());
  }
}

class FirstPayWall extends ConsumerStatefulWidget {
  const FirstPayWall({super.key});

  @override
  ConsumerState<FirstPayWall> createState() => _FirstPayWallState();
}

class _FirstPayWallState extends ConsumerState<FirstPayWall> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChange);
  }

  void _onPageChange() {
    final updatedPage = _pageController.page!.round();
    if (updatedPage != currentPage) {
      setState(() {
        currentPage = updatedPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: context.isBigScreen ? 48.0 : 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: context.width,
                      minWidth: context.width,
                      maxHeight: context.isBigScreen ? 450 : 300,
                      minHeight: 250),
                  child: PageView(
                    controller: _pageController,
                    children: [
                      PayWallStepWidget(
                        mainImagePath: 'assets/images/filter.png',
                        littleCirclePath: 'assets/images/small_ell_spam.png',
                        bigCirclePath: 'assets/images/ell_spam.png',
                        title: S.of(context).spamFilter,
                        description: S.of(context).spamFilterBody,
                      ),
                      PayWallStepWidget(
                        mainImagePath: 'assets/images/phishing.png',
                        littleCirclePath: 'assets/images/small_ell_phi.png',
                        bigCirclePath: 'assets/images/ell_phi.png',
                        title: S.of(context).phishingFilter,
                        description: S.of(context).phisingFilterBody,
                      ),
                      PayWallStepWidget(
                        mainImagePath: 'assets/images/ads.png',
                        littleCirclePath: 'assets/images/small_ell_ads.png',
                        bigCirclePath: 'assets/images/ell_ads.png',
                        title: S.of(context).adwareFilter,
                        description: S.of(context).adwareFilterBody,
                      ),
                      PayWallStepWidget(
                        mainImagePath: 'assets/images/bit.png',
                        littleCirclePath: 'assets/images/small_ell_bit.png',
                        bigCirclePath: 'assets/images/ell_bit.png',
                        title: S.of(context).cryptominersFilter,
                        description: S.of(context).cryptominersFilterBody,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                PaginationWidget(
                  currentPage: currentPage,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: context.isBigScreen ? 16 : 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: 180,
                        maxHeight: 220,
                        minWidth: context.width,
                        maxWidth: context.width),
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          height: 220,
                          decoration: BoxDecoration(
                            border: Border.all(color: _getBorderColor()),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          duration: const Duration(milliseconds: 300),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const Alignment(0, 0.2),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        S.of(context).full_base,
                                        style: TextStyle(
                                          color: _getTextPointColor(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        S.of(context).security,
                                        style: TextStyle(
                                          color: _getTextPointColor(),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        S.of(context).best_service,
                                        style: TextStyle(
                                          color: _getTextPointColor(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0, 0.9),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "3 days free trial — after \$9.99 / week",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              context.isBigScreen ? 18 : 14,
                                          color: _getPriceColor(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            HapticFeedback.vibrate();

                            ref
                                .read(subscriptionStatusController.notifier)
                                .buySubscription();
                            Navigator.of(context).push(TutorialOverlay());
                          },
                          child: AnimatedContainer(
                            height: 59,
                            decoration: BoxDecoration(
                              boxShadow: [
                                _getButtonShadow(),
                              ],
                              border: Border.all(
                                color: _getMainBorderColor(),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            duration: const Duration(milliseconds: 300),
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
                                    ]),
                                child: Center(
                                  child: Text(
                                    S.of(context).activate,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                      color: _getTextColor(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(
                            () => const InfoScreen(
                                title: "Privacy Policy",
                                infoType: InfoType.privacy),
                          );
                        },
                        child: Text(
                          "Privacy Policy",
                          style: _getTextButtonStyle(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ref
                              .read(subscriptionStatusController.notifier)
                              .buySubscription();
                        },
                        child: Text(
                          S.of(context).restore,
                          style: _getTextButtonStyle(),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            () => const InfoScreen(
                                title: "Terms of Use",
                                infoType: InfoType.terms),
                          );
                        },
                        child: Text(
                          "Terms of Use",
                          style: _getTextButtonStyle(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle _getTextButtonStyle() {
    final textStyle = TextStyle(
      decoration: TextDecoration.underline,
      color: const Color(0xFFE2FFE0).withOpacity(0.5),
    );
    switch (currentPage) {
      case 0:
        return textStyle.copyWith(
          color: const Color(0xFFE2FFE0).withOpacity(0.5),
        );
      case 1:
        return textStyle.copyWith(
          color: const Color(0xFFB9D9FF).withOpacity(0.52),
        );

      case 2:
        return textStyle.copyWith(
          color: const Color(0xFFFFCEDA).withOpacity(0.52),
        );

      case 3:
        return textStyle.copyWith(
          color: const Color(0xFFFFFCB5).withOpacity(0.52),
        );

      default:
        return textStyle.copyWith(
          color: const Color(0xFFFFFCB5).withOpacity(0.22),
        );
    }
  }

  Color _getTextColor() {
    switch (currentPage) {
      case 0:
        return const Color(0xFFC0FFB8);
      case 1:
        return const Color(0xFFB6D7FF);

      case 2:
        return const Color(0xFFFFBACA);

      case 3:
        return const Color(0xFFEBE67C);

      default:
        return const Color(0xFFDEDA70);
    }
  }

  Color _getMainBorderColor() {
    switch (currentPage) {
      case 0:
        return const Color(0xFFA7FF9C);
      case 1:
        return const Color(0xFF8EC2FF);

      case 2:
        return const Color(0xFFFF96B0);

      case 3:
        return const Color(0xFFDEDA70);

      default:
        return const Color(0xFFDEDA70);
    }
  }

  BoxShadow _getButtonShadow() {
    switch (currentPage) {
      case 0:
        return BoxShadow(
          color: const Color(0xFFA7FF9C).withAlpha(60),
          blurRadius: 8.0,
          spreadRadius: 4.0,
        );
      case 1:
        return BoxShadow(
          color: const Color(0xFF8EC2FF).withAlpha(60),
          blurRadius: 8.0,
          spreadRadius: 4.0,
        );

      case 2:
        return BoxShadow(
          color: const Color(0xFFFF96B0).withAlpha(60),
          blurRadius: 8.0,
          spreadRadius: 4.0,
        );

      case 3:
        return BoxShadow(
          color: const Color(0xFFDEDA70).withAlpha(60),
          blurRadius: 8.0,
          spreadRadius: 4.0,
        );

      default:
        return BoxShadow(
          color: _getMainBorderColor().withAlpha(60),
          blurRadius: 8.0,
          spreadRadius: 4.0,
        );
    }
  }

  Color _getTextPointColor() {
    switch (currentPage) {
      case 0:
        return const Color(0xFFE2FFE0).withOpacity(0.7);
      case 1:
        return const Color(0xFFB9D9FF).withOpacity(0.72);

      case 2:
        return const Color(0xFFFFCEDA).withOpacity(0.72);

      case 3:
        return const Color(0xFFFFFCB5).withOpacity(0.7);

      default:
        return const Color(0xFFFFFCB5).withOpacity(0.75);
    }
  }

  Color _getPriceColor() {
    switch (currentPage) {
      case 0:
        return const Color(0xFFE2FFE0).withOpacity(0.8);
      case 1:
        return const Color(0xFFB9D9FF).withOpacity(0.82);

      case 2:
        return const Color(0xFFFFCEDA).withOpacity(0.82);

      case 3:
        return const Color(0xFFFFFCB5).withOpacity(0.8);

      default:
        return const Color(0xFFFFFCB5).withOpacity(0.85);
    }
  }

  // const Color(0xFFE2FFE0).withOpacity(0.25);
  Color _getBorderColor() {
    switch (currentPage) {
      case 0:
        return const Color(0xFFE2FFE0).withOpacity(0.25);
      case 1:
        return const Color(0xFFB9D9FF).withOpacity(0.27);

      case 2:
        return const Color(0xFFFFCEDA).withOpacity(0.27);

      case 3:
        return const Color(0xFFFFFCB5).withOpacity(0.25);

      default:
        return const Color(0xFFFFFCB5).withOpacity(0.25);
    }
  }
}

class PaginationWidget extends StatelessWidget {
  final int currentPage;

  const PaginationWidget({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          _PaginationStepWidget(
            isSelected: currentPage == 0,
          ),
          _PaginationStepWidget(
            isSelected: currentPage == 1,
          ),
          _PaginationStepWidget(
            isSelected: currentPage == 2,
          ),
          _PaginationStepWidget(
            isSelected: currentPage == 3,
          ),
        ],
      ),
    );
  }
}

class _PaginationStepWidget extends StatelessWidget {
  final bool isSelected;

  const _PaginationStepWidget({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      height: 10,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.white.withOpacity(0.76) : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.28),
          ),
        ),
      ),
    );
  }
}

class PayWallStepWidget extends StatelessWidget {
  final String mainImagePath;
  final String littleCirclePath;
  final String bigCirclePath;
  final String title;
  final String description;

  const PayWallStepWidget({
    super.key,
    required this.mainImagePath,
    required this.littleCirclePath,
    required this.bigCirclePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: context.width,
              minWidth: context.width,
              maxHeight: 240,
              minHeight: 230),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0.7, 0.8),
                child: Image.asset(
                  mainImagePath,
                  width: context.width * 0.7,
                  height: context.width * 0.5,
                ),
              ),
              Align(
                alignment: const Alignment(-0, -.3),
                child: Image.asset(
                  bigCirclePath,
                  width: context.width * 0.64,
                  height: context.width * 0.46,
                ),
              ),
              Align(
                alignment: const Alignment(-0.5, -.5),
                child: Image.asset(
                  littleCirclePath,
                  width: 38,
                  height: 38,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: context.isBigScreen ? 14 : 10,
              fontWeight: FontWeight.w300,
              color: Colors.white.withOpacity(0.76),
            ),
          ),
        )
      ],
    );
  }
}
