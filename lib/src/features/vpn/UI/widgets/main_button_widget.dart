import 'package:flutter/material.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';

class MainButtonWidget extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const MainButtonWidget({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainBackgroundButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        )
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
