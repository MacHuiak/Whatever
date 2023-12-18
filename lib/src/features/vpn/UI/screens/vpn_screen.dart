import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
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
import 'package:modern_vpn_project/src/features/vpn/logics/rate_app/rate_app.dart';
import 'package:modern_vpn_project/src/features/vpn/logics/server/server_list.dart';
import 'package:modern_vpn_project/src/features/vpn/logics/sword_controller/sword_controller.dart';
import 'package:modern_vpn_project/src/features/vpn/models/connection_vpn_status.dart';
import 'package:modern_vpn_project/src/features/vpn/models/host.dart';
import 'package:modern_vpn_project/src/features/vpn/services/vpn_connection_service.dart';

class MainVPNScreen extends StatefulHookConsumerWidget {
  const MainVPNScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MainVPNState();
}

class MainVPNState extends ConsumerState<MainVPNScreen> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    HostData? selectedHost = ref.watch(selectedHostProvider);
    bool shouldRate = ref.watch(rateNotifier);
    return Scaffold(
      // key: globalKey,
      // endDrawer: const BorderSideMenu(),
      appBar: AppBar(
        leadingWidth: 150,
        backgroundColor: Colors.black,
        leading: const Center(
          child: HeaderWidgetTitle(),
        ),
        // actions: [
        //   IconButton(
        //     padding: EdgeInsets.zero,
        //     onPressed: () {
        //       globalKey.currentState!.openEndDrawer();
        //     },
        //     icon: const Icon(
        //       Icons.menu,
        //       color: AppColors.subTitleColor,
        //     ),
        //   )
        // ]
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // TODO: add vpn body
          // Align(
          //   alignment: const Alignment(0, 0),
          //   child: ElevatedButton(
          //     onPressed: () {
          //
          //     },
          //     child: const Text("Click"),
          //   ),
          // ),

          Align(
            alignment: const Alignment(0, 0.4),
            child: LightSwordWidget(
              onStart: () {
                ref
                    .read(connectionProvider.notifier)
                    .startConnection(selectedHost!);

                if (shouldRate) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Dialog(
                          insetPadding: EdgeInsets.zero,
                          child: RateAppWidget());
                    },
                  );
                }
                ref.read(rateNotifier.notifier).updateLaunchCount();
              },
            ),
          ),
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
          const Align(
            alignment: Alignment(0, 0.4),
            child: ConnectionInfoWidget(),
          ),
          const Align(
            alignment: Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [DownloadInfoWidget(), InfoUploadWidget()],
            ),
          ),
        ],
      ),
    );
  }
}

class RateAppWidget extends StatefulHookConsumerWidget {
  const RateAppWidget({super.key});

  @override
  ConsumerState<RateAppWidget> createState() => _RateAppWidgetState();
}

class _RateAppWidgetState extends ConsumerState<RateAppWidget> {
  double rate = 3;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: SizedBox(
        height: 400,
        width: context.width * 0.8,
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, -0.8),
              child: Image.asset(
                "assets/images/rate_saber.png",
                width: 128,
                height: 128,
              ),
            ),
            const Align(
              alignment: Alignment(0, 0.1),
              child: Text(
                "Rate our app and may the force be with you",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.5),
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                unratedColor: Colors.amber.withAlpha(50),
                itemCount: 5,
                itemSize: 50.0,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    rate = rating;
                  });
                },
                updateOnDrag: true,
              ),
            ),
            Align(
              alignment: const Alignment(0, 0.9),
              child: ElevatedButton(
                onPressed: () {
                  ref.read(rateNotifier.notifier).rateApp(rate);
                  Navigator.of(context).pop();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text("Rate App"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const ConnectionStatus connectionStatus = ConnectionStatus.connected;

class ConnectionInfoWidget extends ConsumerWidget {
  const ConnectionInfoWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: DI.getDependency<VpnConnectionService>().connectionStatus,
      builder: (context, snapshot) {
        final connectionStatus = snapshot.data ?? ConnectionStatus.disconnected;
        switch (connectionStatus) {
          case ConnectionStatus.disconnected:
            return Text(
              S.of(context).dragSwordToStartNvpnConnection,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            );
          case ConnectionStatus.connected:
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  foregroundColor: Colors.white),
              onPressed: () {
                ref.read(swordController.notifier).reboot();
                ref.read(connectionProvider.notifier).stopConnection();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.cancel),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(S.of(context).cancelConnection),
                ],
              ),
            );
          case ConnectionStatus.connecting:
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.3),
                  foregroundColor: Colors.white),
              onPressed: () {
                ref.read(connectionProvider.notifier).stopConnection();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.cancel),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(S.of(context).cancelConnection),
                ],
              ),
            );
          case ConnectionStatus.disconnecting:
            return const SizedBox();
        }
      },
    );
  }
}
