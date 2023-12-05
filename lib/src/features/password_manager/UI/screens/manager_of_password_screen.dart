import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/extension.dart';
import 'package:modern_vpn_project/src/features/password_manager/UI/widgets/closed_password_widget.dart';
import 'package:modern_vpn_project/src/features/password_manager/UI/widgets/open_password_widget.dart';
import 'package:modern_vpn_project/src/features/password_manager/models/stored_password.dart';

@RoutePage()
class PasswordManagerScreen extends StatefulWidget {
  const PasswordManagerScreen({super.key});

  @override
  State<PasswordManagerScreen> createState() => _PasswordManagerScreenState();
}

class _PasswordManagerScreenState extends State<PasswordManagerScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late bool isBigScreen;

  @override
  void didChangeDependencies() {
    isBigScreen = context.width > 400 && context.height > 900;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: false,
        leading: InkWell(
          borderRadius: BorderRadius.circular(90),
          onTap: () {
            context.router.pop();
          },
          child: const Center(
            child: Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        title: Text(
          'Password manager',
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
            GestureDetector(
              onTap: () {
                // router.pushNamed(RootNameRoute.addNewPassword);
              },
              child: Container(
                height: 56,
                width: 132,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF2D2D2D)),
                child: const Padding(
                  padding: EdgeInsets.all(21),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text('Add new',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            StreamBuilder<List<StoredPassword>>(
              stream: Stream.empty(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.white400,
                      ),
                    ),
                  );
                } else {
                  final passwords = snapshot.data ?? [];
                  return passwords.isEmpty
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 120.0),
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  text: "Use",
                                  children: [
                                    TextSpan(
                                      text: " «Add new» \n",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20),
                                    ),
                                    TextSpan(text: "to add new password")
                                  ],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        )
                      : ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = snapshot.data?[index];
                            return PasswordStorageWidget(item: item);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 16);
                          },
                          itemCount: snapshot.data?.length ?? 0);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class PasswordStorageWidget extends StatefulWidget {
  final StoredPassword? item;

  const PasswordStorageWidget({super.key, required this.item});

  @override
  State<PasswordStorageWidget> createState() => _PasswordStorageWidgetState();
}

class _PasswordStorageWidgetState extends State<PasswordStorageWidget> {
  var isOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isOpen
          ? OpenedPasswordWidget(
              onTap: () {
                setState(() {
                  isOpen = !isOpen;
                });
              },
              item: widget.item!)
          : ClosedPasswordWidget(
              onTap: () {
                setState(() {
                  isOpen = !isOpen;
                });
              },
              item: widget.item!,
            ),
    );
  }
}


