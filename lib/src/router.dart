import 'package:auto_route/auto_route.dart';
import 'package:modern_vpn_project/src/features/init/UI/screen/splash_screen.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/screens/server_list.dart';
import 'package:modern_vpn_project/src/features/vpn/UI/screens/vpn_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/splash",initial: true),
        AutoRoute(
          page: MainVPNRoute.page,
          path: "/mainVPN",
          children: [
            AutoRoute(page: ServerListRoute.page, path: "servers"),
            // AutoRoute(page: PasswordManagerRoute.page, path: "password"),
          ],
        ),
      ];
}
