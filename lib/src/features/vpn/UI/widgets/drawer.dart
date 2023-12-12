import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/in_app_extension.dart';

class BorderSideMenu extends StatelessWidget {
  const BorderSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerColor,
      child: Stack(
        children: [
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: Container(
                height: context.height,
                width: context.width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  //TODO: add icon
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).closeEndDrawer();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.white400,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
