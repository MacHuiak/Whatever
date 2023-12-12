


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/in_app_extension.dart';
import 'package:modern_vpn_project/src/features/password_manager/models/stored_password.dart';

class ClosedPasswordWidget extends StatelessWidget {
  final StoredPassword item;
  final Function onTap;

  const ClosedPasswordWidget(
      {super.key, required this.onTap, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: context.width,
      decoration: BoxDecoration(
        color: AppColors.mainBackgroundButtonColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.site ?? "",
              style: const TextStyle(color: AppColors.white400),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    // await DependencyInjectorService.I.passRepository
                    //     .deletePassword(site: widget.item!.site);
                  },
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.red400,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}