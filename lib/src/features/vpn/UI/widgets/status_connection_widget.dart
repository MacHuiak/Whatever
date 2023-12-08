import 'package:flutter/material.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/extension.dart';
import 'package:modern_vpn_project/src/features/vpn/models/connection_vpn_status.dart';

class ConnectionStatusWidget extends StatelessWidget {
  const ConnectionStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream<ConnectionTypeElement>.value(
          ConnectionTypeElement.disconnected),
      builder: (context, snapshot) {
        ConnectionTypeElement connectionType =
            snapshot.data ?? ConnectionTypeElement.disconnected;
        return Container(
          width: 240,
          child: DecoratedBox(
            decoration: switch (connectionType) {
              ConnectionTypeElement.disconnected => BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFA7A7A7),
                ),
              ConnectionTypeElement.connected => BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFB5FFAC),
                  ),
                  color: const Color(0xFFA7A7A7),
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
              ConnectionTypeElement.connecting => BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFFFFF2AE),
                  ),
                  color: const Color(0xFFA7A7A7),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFFFF2AE).withAlpha(60),
                      blurRadius: 6.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        0.0,
                        3.0,
                      ),
                    ),
                  ],
                ),
              ConnectionTypeElement.disconnecting => BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xFFA7A7A7),
                ),
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                switch (connectionType) {
                  ConnectionTypeElement.connected => const Padding(
                      padding: EdgeInsets.only(right: 14.0),
                      child: Icon(
                        //TODO: add icon
                        Icons.network_wifi_sharp,
                        size: 24,
                        color: AppColors.green400,
                      ),
                    ),
                  ConnectionTypeElement.connecting => const Padding(
                      padding: EdgeInsets.only(right: 14.0),
                      child: CircularProgressIndicator(
                        color: Color(0xFFFFD600),
                      ),
                    ),
                  ConnectionTypeElement.disconnecting ||
                  ConnectionTypeElement.disconnected =>
                    const SizedBox.shrink(),
                },
                Text(
                  connectionType.connectionStageValue,
                  textAlign: TextAlign.center,
                  style: context.isBigScreen
                      ? const TextStyle(fontSize: 26, color: AppColors.white100)
                      : const TextStyle(
                          fontSize: 24, color: AppColors.white100),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
