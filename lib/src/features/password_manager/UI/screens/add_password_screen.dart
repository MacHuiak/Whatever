import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';

@RoutePage()
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
          'Add new',
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
            const Title(title: 'Site'),
            PassTextField(controller: siteController, hintText: 'Site'),
            const Title(title: 'Login'),
            PassTextField(controller: loginController, hintText: 'Login'),
            const Title(title: 'Password'),
            PassTextField(controller: passwordController, hintText: 'Password'),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if (siteController.text.isNotEmpty &&
                      loginController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    // await DependencyInjectorService.I.passRepository
                    //     .savePassword(
                    //         site: siteController.text,
                    //         login: loginController.text,
                    //         password: passwordController.text);
                    Get.back();
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(context.width, 58),
                    backgroundColor: const Color(0xFF2D2D2D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24))),
                child: const Text(
                  'Add',
                  style: TextStyle(
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
