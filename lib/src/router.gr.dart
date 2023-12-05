// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MainVPNRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainVPNScreen(),
      );
    },
    ServerListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ServerListScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [MainVPNScreen]
class MainVPNRoute extends PageRouteInfo<void> {
  const MainVPNRoute({List<PageRouteInfo>? children})
      : super(
          MainVPNRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainVPNRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ServerListScreen]
class ServerListRoute extends PageRouteInfo<void> {
  const ServerListRoute({List<PageRouteInfo>? children})
      : super(
          ServerListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ServerListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
