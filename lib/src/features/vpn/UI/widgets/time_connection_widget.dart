import 'package:flutter/material.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/features/vpn/services/vpn_connection_service.dart';

class ConnectionTimeWidget extends StatelessWidget {
  const ConnectionTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: add builder for time
    return StreamBuilder<int>(
      stream: DI.getDependency<VpnConnectionService>().connectionTime,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        final seconds = snapshot.data ?? 0;
        return Text(
          formatTime(seconds),
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.greyDarker,fontSize: 42,fontFamily: "bruno"),
        );
      },
    );
  }

  String formatTime(int connectionTime) {
    final seconds = connectionTime % 60;
    final minutes = connectionTime % 3600 ~/ 60;
    final hours = connectionTime ~/ 3600;
    return "${_addAdditionalZero(hours)}:${_addAdditionalZero(minutes)}:${_addAdditionalZero(seconds)}";
  }

  _addAdditionalZero(int time) => time < 10 ? "0$time" : "$time";
}
