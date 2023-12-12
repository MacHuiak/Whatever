import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vpn_project/src/assets/colors.dart';
import 'package:modern_vpn_project/src/features/vpn/logics/server/server_list.dart';
import 'package:modern_vpn_project/src/in_app_extension.dart';
import 'package:modern_vpn_project/src/features/vpn/models/connection_vpn_status.dart';
import 'package:modern_vpn_project/src/features/vpn/models/host.dart';
import 'package:modern_vpn_project/src/features/vpn/models/vpn_config.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServerListScreen extends HookConsumerWidget {
  const ServerListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<HostData> loadedHosts = ref.watch(loadedHostsProvider);
    HostData? selectedHost = ref.watch(selectedHostProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leadingWidth: 200,
            pinned: true,
            backgroundColor: Colors.black,
            leading: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                ),
                Text(
                  "Server selection",
                  style: context.isBigScreen
                      ? const TextStyle(fontSize: 18, color: AppColors.white100)
                      : const TextStyle(color: AppColors.white100),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2D2D2D),
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add user config",
                              style: context.isBigScreen
                                  ? const TextStyle(
                                      color: AppColors.white100, fontSize: 18)
                                  : const TextStyle(color: AppColors.white100),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          loadedHosts.isEmpty
              ? SliverList.list(
                  children: const [
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  sliver: SliverList.separated(
                    itemCount: loadedHosts.length,
                    itemBuilder: (BuildContext context, int index) {
                      // ignore: invalid_null_aware_operator

                      final currentHost = loadedHosts[index];
                      VPNConfig? item = HostVPNConfig(
                        host: currentHost,
                      );
                      switch (item) {
                        case HostVPNConfig _:
                          final currentItem = item;
                          return _SelectServerButton(
                              flag: currentHost.imagePath,
                              onServerSelect: () {
                                ref
                                    .read(hostInfoProvider.notifier)
                                    .selectHost(currentHost);
                              },
                              connectionType: selectedHost == currentHost
                                  ? ConnectionStatus.connected
                                  : ConnectionStatus.disconnected,
                              name: currentItem.host.country);
                        case UserFileVPNConfig _:
                          final currentItem = item;
                          return _SelectServerButton(
                              onServerSelect: () {},
                              connectionType: selectedHost == currentHost
                                  ? ConnectionStatus.connected
                                  : ConnectionStatus.disconnected,
                              //TODO: add placeholder
                              name: currentItem.configName);
                        default:
                          return const SizedBox();
                      }
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
// @RoutePage()
// class ServerListScreen extends StatefulWidget {
//   const ServerListScreen({super.key});
//
//   @override
//   State<ServerListScreen> createState() => _ServerListScreenState();
// }
//
// class _ServerListScreenState extends State<ServerListScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             leadingWidth: 200,
//             pinned: true,
//             backgroundColor: Colors.black,
//             leading: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back_ios_new_rounded,
//                     size: 20,
//                     color: Colors.white,
//                   ),
//                   padding: EdgeInsets.zero,
//                 ),
//                 Text(
//                   "Server selection",
//                   style: context.isBigScreen
//                       ? const TextStyle(fontSize: 18, color: AppColors.white100)
//                       : const TextStyle(color: AppColors.white100),
//                 )
//               ],
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8),
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF2D2D2D),
//                         padding: EdgeInsets.zero,
//                         alignment: Alignment.centerLeft,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 16.0, vertical: 16),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Add user config",
//                               style: context.isBigScreen
//                                   ? const TextStyle(
//                                       color: AppColors.white100, fontSize: 18)
//                                   : const TextStyle(color: AppColors.white100),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           false
//               ? SliverList.list(
//                   children: const [
//                     Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   ],
//                 )
//               : SliverPadding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8),
//                   sliver: SliverList.separated(
//                     itemCount: 10,
//                     itemBuilder: (BuildContext context, int index) {
//                       // ignore: invalid_null_aware_operator
//                       VPNConfig? item = HostVPNConfig(
//                         host: const HostData(
//                             ip: '', country: '', imagePath: '', id: ''),
//                       );
//                       switch (item) {
//                         case HostVPNConfig _:
//                           final currentItem = item;
//                           return _SelectServerButton(
//                               onServerSelect: () {},
//                               connectionType: false
//                                   ? ConnectionTypeElement.connected
//                                   : ConnectionTypeElement.disconnected,
//                               name: currentItem.host.country);
//                         case UserFileVPNConfig _:
//                           final currentItem = item;
//                           return _SelectServerButton(
//                               onServerSelect: () {},
//                               connectionType: false
//                                   ? ConnectionTypeElement.connected
//                                   : ConnectionTypeElement.disconnected,
//                               //TODO: add placeholder
//                               flag: "",
//                               name: currentItem.configName);
//                         default:
//                           return const SizedBox();
//                       }
//                     },
//                     separatorBuilder: (BuildContext context, int index) {
//                       return const SizedBox(
//                         height: 16,
//                       );
//                     },
//                   ),
//                 )
//         ],
//       ),
//     );
//   }
// }

class _SelectServerButton extends StatefulWidget {
  final String? flag;
  final String name;
  final void Function()? onServerSelect;
  final ConnectionStatus connectionType;

  const _SelectServerButton({
    Key? key,
    this.flag,
    required this.name,
    this.onServerSelect,
    required this.connectionType,
  }) : super(key: key);

  @override
  State<_SelectServerButton> createState() => _SelectServerButtonState();
}

class _SelectServerButtonState extends State<_SelectServerButton> {
  ConnectionStatus get connectionType => widget.connectionType;
  late bool isBigScreen;

  @override
  void didChangeDependencies() {
    isBigScreen = context.width > 400 && context.height > 900;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    switch (connectionType) {
      case ConnectionStatus.connected:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF545454),
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xFFB5FFAC),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: widget.onServerSelect,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              children: [
                widget.flag == null
                    ? const Icon(
                        Icons.shield,
                        color: Colors.white,
                        size: 24,
                      )
                    : Image.asset(widget.flag!, height: 24, width: 24),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.name,
                  style: isBigScreen
                      ? const TextStyle(color: AppColors.white100, fontSize: 18)
                      : const TextStyle(color: AppColors.white100),
                ),
                const Spacer(),
                const Icon(
                  //TODO: add icon
                  Icons.gpp_good_outlined,
                  color: AppColors.green400,
                  size: 24,
                )
              ],
            ),
          ),
        );
      case ConnectionStatus.disconnected:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.borderGrey,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: widget.onServerSelect,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              children: [
                widget.flag == null
                    ? const Icon(
                        Icons.shield,
                        color: Colors.white,
                        size: 24,
                      )
                    : Image.asset(widget.flag!, height: 24, width: 24),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.name,
                  style: isBigScreen
                      ? const TextStyle(color: AppColors.white100, fontSize: 18)
                      : const TextStyle(color: AppColors.white100),
                ),
                const Spacer(),
                const Icon(
                  Icons.add,
                  color: Color(0xFFA7A7A9),
                )
              ],
            ),
          ),
        );
      case ConnectionStatus.disconnecting:
      case ConnectionStatus.connecting:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: const Color(0xFFFFF2AE).withAlpha(60),
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Color(0xFFFFF2AE),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: widget.onServerSelect,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Row(
              children: [
                widget.flag == null
                    ? const Icon(
                        Icons.shield,
                        color: Colors.white,
                        size: 24,
                      )
                    : Image.asset(widget.flag!, height: 24, width: 24),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  widget.name,
                  style: isBigScreen
                      ? const TextStyle(color: AppColors.white100, fontSize: 18)
                      : const TextStyle(color: AppColors.white100),
                ),
                const Spacer(),
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: RepaintBoundary(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFA7A7A9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}
