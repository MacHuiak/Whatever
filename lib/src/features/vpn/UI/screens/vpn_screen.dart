import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/features/password_manager/UI/screens/manager_of_password_screen.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/drawer.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/header_widget_title.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/main_vpn_widget.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/select_server_button.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/status_connection_widget.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/time_connection_widget.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/upload_and_download_widget.dart';
import 'package:modern_vpn_project/src/features/vpn/logics/connection/connection.dart';
import 'package:modern_vpn_project/src/features/vpn/logics/server/server_list.dart';
import 'package:modern_vpn_project/src/features/vpn/models/host.dart';

// @RoutePage()
// class MainVPNScreen extends StatefulWidget {
//   const MainVPNScreen({super.key});
//
//   @override
//   State<MainVPNScreen> createState() => _MainVPNScreenState();
// }
//
// class _MainVPNScreenState extends State<MainVPNScreen> {
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       endDrawer: const BorderSideMenu(),
//       appBar: AppBar(
//         leadingWidth: 150,
//         backgroundColor: Colors.black,
//         leading: const Center(
//           child: HeaderWidgetTitle(),
//         ),
//         actions: [
//           IconButton(
//             padding: EdgeInsets.zero,
//             onPressed: () {
//               scaffoldKey.currentState!.openEndDrawer();
//             },
//             icon: const Icon(
//               Icons.menu,
//               color: AppColors.subTitleColor,
//             ),
//           )
//         ],
//       ),
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           //TODO: add vpn body
//           // Align(
//           //   alignment: const Alignment(0, 0),
//           //   child: VpnBodyWidget(),
//           // ),
//
//           // Align(
//           //   alignment: const Alignment(0, 0.4),
//           //   child: LightSwordWidget(
//           //     onStart: () {},
//           //   ),
//           // ),
//           Align(
//             alignment: const Alignment(0.85, -0.92),
//             child: GestureDetector(
//               onTap: () {
//                 Get.to(() => const PasswordManagerScreen());
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                     color: AppColors.white400.withOpacity(0.5),
//                     shape: BoxShape.circle),
//                 child: const Padding(
//                   padding: EdgeInsets.all(6.0),
//                   child: Icon(Icons.key, size: 40, color: Colors.yellow),
//                 ),
//               ),
//             ),
//           ),
//           Align(
//             alignment: const Alignment(0, -0.9),
//             child: SizedBox(
//               width: context.width,
//               child: const Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(bottom: 8.0),
//                     child: ConnectionTimeWidget(),
//                   ),
//                   ConnectionStatusWidget(),
//                   SizedBox(
//                     height: 24,
//                   ),
//                   ServerSelectButton()
//                 ],
//               ),
//             ),
//           ),
//           //TODO need add
//
//           const Align(
//             alignment: Alignment(0, 0.8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 DownloadInfoWidget(),
//                 //TODO:add upload
//                 InfoUploadWidget()
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MainVPNScreen extends HookConsumerWidget {
  const MainVPNScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HostData? selectedHost = ref.watch(selectedHostProvider);
    final globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: globalKey,
      endDrawer: const BorderSideMenu(),
      appBar: AppBar(
        leadingWidth: 150,
        backgroundColor: Colors.black,
        leading: const Center(
          child: HeaderWidgetTitle(),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              globalKey.currentState!.openEndDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: AppColors.subTitleColor,
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          //TODO: add vpn body
          Align(
            alignment: const Alignment(0, 0),
            child: ElevatedButton(
              onPressed: () {
                ref
                    .read(connectionProvider.notifier)
                    .startConnection(selectedHost!);
              },
              child: Text("Click"),
            ),
          ),

          // Align(
          //   alignment: const Alignment(0, 0.4),
          //   child: LightSwordWidget(
          //     onStart: () {},
          //   ),
          // ),
          Align(
            alignment: const Alignment(0.85, -0.92),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const PasswordManagerScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.white400.withOpacity(0.5),
                    shape: BoxShape.circle),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.key, size: 40, color: Colors.yellow),
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, -0.9),
            child: SizedBox(
              width: context.width,
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: ConnectionTimeWidget(),
                  ),
                  ConnectionStatusWidget(),
                  SizedBox(
                    height: 24,
                  ),
                  ServerSelectButton()
                ],
              ),
            ),
          ),
          //TODO need add

          const Align(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DownloadInfoWidget(),
                //TODO:add upload
                InfoUploadWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
