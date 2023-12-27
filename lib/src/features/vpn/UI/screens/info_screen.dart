import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/features/vpn/consts/text_consts.dart';
import 'package:modern_vpn_project/src/in_app_extension.dart';

enum InfoType { privacy, terms }

class InfoScreen extends StatelessWidget {
  final String title;
  final InfoType infoType;

  const InfoScreen({super.key, required this.title, required this.infoType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 200,
            pinned: true,
            backgroundColor: Colors.black,
            leading: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                ),
                Text(
                  title,
                  style: context.isBigScreen
                      ? const TextStyle(fontSize: 18, color: AppColors.white100)
                      : const TextStyle(color: AppColors.white100),
                )
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                width: context.width,
                child: Text(
                  infoType == InfoType.privacy ? privacyPolicy : termsOfUse,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}