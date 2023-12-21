import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/widgets/icomoon_icons.dart';
import 'package:modern_vpn_project/src/features/vpn/services/vpn_connection_service.dart';
import 'package:modern_vpn_project/src/in_app_extension.dart';
import 'package:modern_vpn_project/src/features/vpn/models/connection_vpn_status.dart';

class ConnectionStatusWidget extends StatelessWidget {
  const ConnectionStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: kDebugMode
          ? Stream<ConnectionStatus>.value(ConnectionStatus.connected)
          : DI.getDependency<VpnConnectionService>().connectionStatus,
      builder: (context, snapshot) {
        ConnectionStatus connectionType =
            snapshot.data ?? ConnectionStatus.disconnected;
        return SizedBox(
          width: 245,
          child: DecoratedBox(
            decoration: switch (connectionType) {
              ConnectionStatus.disconnected => BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFA7A7A7),
                  ),
                  color: Colors.transparent,
                ),
              ConnectionStatus.connected => BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFB5FFAC),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFB5FFAC).withAlpha(60),
                      blurRadius: 6.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        0.0,
                        3.0,
                      ),
                    ),
                  ],
                ),
              ConnectionStatus.connecting => BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFFFF2AE),
                  ),
                  color: Colors.transparent,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: const Color(0xFFFFF2AE).withAlpha(60),
                  //     blurRadius: 6.0,
                  //     spreadRadius: 0.0,
                  //     offset: const Offset(
                  //       0.0,
                  //       3.0,
                  //     ),
                  //   ),
                  // ],
                ),
              ConnectionStatus.disconnecting => BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFA7A7A7),
                ),
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 8.0,
                        spreadRadius: 10.0,
                      ),
                    ]),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    switch (connectionType) {
                      ConnectionStatus.connected => const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icomoon.yes,
                            size: 24,
                            color: AppColors.green400,
                          ),
                        ),
                      ConnectionStatus.connecting => const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            width: 28,
                            height: 28,
                            child: CircularProgressIndicator(
                              color: Color(0xFFFFD600),
                            ),
                          ),
                        ),
                      ConnectionStatus.disconnecting ||
                      ConnectionStatus.disconnected =>
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFA2A2A2)),
                            child: const Center(
                              child: Icon(
                                Icons.close,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                    },
                    Text(
                      connectionType.connectionStageValue,
                      textAlign: TextAlign.center,
                      style: context.isBigScreen
                          ? const TextStyle(
                              fontSize: 26, color: AppColors.white100)
                          : const TextStyle(
                              fontSize: 24, color: AppColors.white100),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
