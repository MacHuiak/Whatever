import 'package:flutter/material.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/extension.dart';

class ServerSelectButton extends StatelessWidget {
  const ServerSelectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.mainBackgroundButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
      child: SizedBox(
        width: 204,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //TODO: set icon
            const Icon(
              Icons.add,
              color: Colors.yellow,
            ),
            Text(
              "Fastest Server",
              style: context.isBigScreen
                  ? const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white)
                  : const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
            ),
            const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Colors.white,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
