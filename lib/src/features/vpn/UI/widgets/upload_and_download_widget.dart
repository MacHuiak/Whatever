import 'package:flutter/material.dart';
import 'package:modern_vpn_project/generated/l10n.dart';
import 'package:modern_vpn_project/src/DI/di_container.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/features/vpn/services/vpn_connection_service.dart';
import 'package:modern_vpn_project/src/in_app_extension.dart';
import 'package:modern_vpn_project/src/features/vpn/models/data_counter_class.dart';

class DownloadInfoWidget extends StatefulWidget {
  const DownloadInfoWidget({
    super.key,
  });

  @override
  State<DownloadInfoWidget> createState() => _DownloadInfoWidgetState();
}

class _DownloadInfoWidgetState extends State<DownloadInfoWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF8B8B8B),
        ),
      ),
      child: StreamBuilder<DataCountInfo>(
        stream: DI.getDependency<VpnConnectionService>().connectionDataCount,
        builder: (context, snapshot) {
          final dataCount = snapshot.data;
          final connectionSpeedInfo = dataCount?.receivedCountWithUnit ??
              const ConnectionSpeedInfo(speedValue: "0", measureUnit: "B");
          return ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: 100, minHeight: 100, minWidth: 160, maxWidth: 160),
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_upward,
                          size: 18,
                          color: Color(0xFF5CF64A),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          S.of(context).download,
                          style:
                              const TextStyle(color: AppColors.subTitleColor),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          connectionSpeedInfo.speedValue,
                          textAlign: TextAlign.end,
                          style: context.isBigScreen
                              ? const TextStyle(
                                  fontSize: 26, color: AppColors.white100)
                              : const TextStyle(color: AppColors.white100),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text('${connectionSpeedInfo.measureUnit}/s',
                              textAlign: TextAlign.end,
                              style: context.isBigScreen
                                  ? const TextStyle(
                                      color: AppColors.subTitleColor)
                                  : const TextStyle(
                                      fontSize: 18,
                                      color: AppColors.subTitleColor)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class InfoUploadWidget extends StatefulWidget {
  const InfoUploadWidget({
    super.key,
  });

  @override
  State<InfoUploadWidget> createState() => _InfoUploadWidgetState();
}

class _InfoUploadWidgetState extends State<InfoUploadWidget> {
  late Stream<DataCountInfo> _dataCountStream;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF8B8B8B),
        ),
      ),
      child: StreamBuilder<DataCountInfo>(
        stream: DI.getDependency<VpnConnectionService>().connectionDataCount,
        builder: (context, snapshot) {
          final dataCount = snapshot.data;
          final connectionSpeedInfo = dataCount?.sentDataCountWithUnit ??
              const ConnectionSpeedInfo(speedValue: "0", measureUnit: "B");
          return ConstrainedBox(
            constraints: const BoxConstraints(
                maxHeight: 100, minHeight: 100, minWidth: 160, maxWidth: 160),
            child: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.arrow_downward,
                          size: 18,
                          color: AppColors.red400,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          S.of(context).upload,
                          style:
                              const TextStyle(color: AppColors.subTitleColor),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          connectionSpeedInfo.speedValue,
                          textAlign: TextAlign.end,
                          style: context.isBigScreen
                              ? const TextStyle(
                                  fontSize: 26, color: AppColors.white100)
                              : const TextStyle(color: AppColors.white100),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: Text(
                            '${connectionSpeedInfo.measureUnit}/s',
                            textAlign: TextAlign.end,
                            style: context.isBigScreen
                                ? const TextStyle(
                                    color: AppColors.subTitleColor)
                                : const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.subTitleColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
