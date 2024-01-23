import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/features/password_manager/models/stored_password.dart';
import 'package:modern_vpn_project/src/features/password_manager/repository/password_repository.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({super.key});

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  late bool isBigScreen;
  TextEditingController siteController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    isBigScreen = context.width > 400 && context.height > 900;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: false,
        // leadingWidth: 30,
        leading: InkWell(
          borderRadius: BorderRadius.circular(90),
          onTap: () {
            Get.back();
          },
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        title: Text(
          S.of(context).addNew,
          style: isBigScreen
              ? const TextStyle(fontSize: 18, color: AppColors.white100)
              : const TextStyle(color: AppColors.white100),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Title(title: S.of(context).site),
            PassTextField(
                controller: siteController, hintText: S.of(context).site),
            Title(title: S.of(context).login),
            PassTextField(
                controller: loginController, hintText: S.of(context).login),
            Title(title: S.of(context).password),
            PassTextField(
                controller: passwordController,
                hintText: S.of(context).password),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (siteController.text.isNotEmpty &&
                      loginController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    DI.getDependency<PasswordRepository>().savePassword(
                          StoredPassword(
                              site: siteController.text,
                              login: loginController.text,
                              password: passwordController.text),
                        );
                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(context.width, 58),
                    backgroundColor: const Color(0xFF2D2D2D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24))),
                child: Text(
                  S.of(context).add,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;

  const Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: Text(
        title,
        style: const TextStyle(color: AppColors.white400),
      ),
    );
  }
}

class PassTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const PassTextField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: SizedBox(
        height: 56,
        child: TextField(
          controller: controller,
          style: const TextStyle(color: AppColors.white400),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.black100),
            contentPadding: const EdgeInsets.only(left: 16),
            fillColor: AppColors.mainBackgroundButtonColor,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.mainBackgroundButtonColor, width: 1.0),
                borderRadius: BorderRadius.circular(16)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: AppColors.mainBackgroundButtonColor, width: 1.0),
                borderRadius: BorderRadius.circular(16)),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.mainBackgroundButtonColor, width: 1.0),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
