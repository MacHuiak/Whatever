import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/in_app_extension.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/screens/server_list.dart';

class ServerSelectButton extends StatelessWidget {
  const ServerSelectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => const ServerListScreen());
      },
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
              CupertinoIcons.globe,
              color: Colors.yellow,
            ),
            Text(
              S.of(context).fastestServer,
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
