
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/screens/vpn_screen.dart';
import 'package:modern_vpn_project/src/features/vpn/logics/subscription/subscription.dart';

class PayWall extends ConsumerStatefulWidget {
  const PayWall({super.key});

  @override
  ConsumerState<PayWall> createState() => _PayWallState();
}

class _PayWallState extends ConsumerState<PayWall> {
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
    ref.listen(subscriptionStatusController, (previous, next) {
      if (previous?.value !=null || (next.value !=null)) {
        Get.offAll(() => const MainVPNScreen());
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: context.width,
                      minWidth: context.width,
                      maxHeight: 450,
                      minHeight: 300),
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
          Align(
            alignment: const Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        minHeight: 120,
                        maxHeight: 120,
                        minWidth: context.width,
                        maxWidth: context.width),
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          height: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: _getBorderColor()),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          duration: const Duration(milliseconds: 300),
                          child: Center(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const Alignment(0, 0.6),
                                  child: Text(
                                    "3 days free trial — after \$9.99 / week",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: _getPriceColor()),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            HapticFeedback.vibrate();
                            ref
                                .read(subscriptionStatusController.notifier)
                                .buySubscription();
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
                        onPressed: () {},
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
      color: const Color(0xFFE2FFE0).withOpacity(0.2),
    );
    switch (currentPage) {
      case 0:
        return textStyle.copyWith(
          color: const Color(0xFFE2FFE0).withOpacity(0.2),
        );
      case 1:
        return textStyle.copyWith(
          color: const Color(0xFFB9D9FF).withOpacity(0.22),
        );

      case 2:
        return textStyle.copyWith(
          color: const Color(0xFFFFCEDA).withOpacity(0.22),
        );

      case 3:
        return textStyle.copyWith(
          color: const Color(0xFFFFFCB5).withOpacity(0.22),
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

  Color _getPriceColor() {
    switch (currentPage) {
      case 0:
        return const Color(0xFFE2FFE0).withOpacity(0.4);
      case 1:
        return const Color(0xFFB9D9FF).withOpacity(0.42);

      case 2:
        return const Color(0xFFFFCEDA).withOpacity(0.42);

      case 3:
        return const Color(0xFFFFFCB5).withOpacity(0.4);

      default:
        return const Color(0xFFFFFCB5).withOpacity(0.25);
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
              maxHeight: 300,
              minHeight: 300),
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0.7, 1.7),
                child: Image.asset(
                  mainImagePath,
                  width: 254,
                  height: 254,
                ),
              ),
              Align(
                alignment: const Alignment(-0, -.3),
                child: Image.asset(
                  bigCirclePath,
                  width: 232,
                  height: 232,
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
            "Protects your smartphone from spam advertising activity",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white.withOpacity(0.76),
            ),
          ),
        )
      ],
    );
  }
}
