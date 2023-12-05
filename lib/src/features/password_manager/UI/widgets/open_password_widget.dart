import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/extension.dart';
import 'package:modern_vpn_project/src/features/password_manager/models/stored_password.dart';

class OpenedPasswordWidget extends StatelessWidget {
  final Function onTap;
  final StoredPassword item;

  const OpenedPasswordWidget(
      {super.key, required this.onTap, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      width: context.width,
      decoration: BoxDecoration(
          color: AppColors.mainBackgroundButtonColor,
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
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
                      onTap: () {
                        onTap();
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.login ?? "",
                  style:
                      const TextStyle(fontSize: 14, color: AppColors.white400),
                ),
                InkWell(
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Copied',
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: Colors.grey.shade400));
                    await Clipboard.setData(
                        ClipboardData(text: item.login ?? ""));
                  },
                  child: const Icon(
                    Icons.copy,
                    color: Colors.grey,
                    size: 20,
                  ),
                )
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.password ?? "",
                  style:
                      const TextStyle(fontSize: 14, color: AppColors.white400),
                ),
                InkWell(
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('Copied',
                            style: TextStyle(color: Colors.black)),
                        backgroundColor: Colors.grey.shade400));
                    await Clipboard.setData(
                        ClipboardData(text: item.password ?? ""));
                  },
                  child: SvgPicture.asset('assets/images/copy.svg',
                      height: 20, width: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
