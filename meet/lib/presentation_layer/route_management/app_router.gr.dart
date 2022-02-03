// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../auth/pages/auth_page.dart' as _i1;
import '../home/widgets/custom_navigation_drawer.dart' as _i2;
import '../settings/pages/settings_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AuthPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthPage());
    },
    CustomDrawerRoute.name: (routeData) {
      final args = routeData.argsAs<CustomDrawerRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CustomDrawer(key: args.key, child: args.child));
    },
    SettingsPageRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsPageRouteArgs>(
          orElse: () => const SettingsPageRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SettingsPage(key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(AuthPageRoute.name, path: '/'),
        _i4.RouteConfig(CustomDrawerRoute.name,
            path: '/custom-drawer',
            children: [
              _i4.RouteConfig(SettingsPageRoute.name,
                  path: 'settings-page', parent: CustomDrawerRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.AuthPage]
class AuthPageRoute extends _i4.PageRouteInfo<void> {
  const AuthPageRoute() : super(AuthPageRoute.name, path: '/');

  static const String name = 'AuthPageRoute';
}

/// generated route for
/// [_i2.CustomDrawer]
class CustomDrawerRoute extends _i4.PageRouteInfo<CustomDrawerRouteArgs> {
  CustomDrawerRoute(
      {_i5.Key? key,
      required _i5.Widget child,
      List<_i4.PageRouteInfo>? children})
      : super(CustomDrawerRoute.name,
            path: '/custom-drawer',
            args: CustomDrawerRouteArgs(key: key, child: child),
            initialChildren: children);

  static const String name = 'CustomDrawerRoute';
}

class CustomDrawerRouteArgs {
  const CustomDrawerRouteArgs({this.key, required this.child});

  final _i5.Key? key;

  final _i5.Widget child;

  @override
  String toString() {
    return 'CustomDrawerRouteArgs{key: $key, child: $child}';
  }
}

/// generated route for
/// [_i3.SettingsPage]
class SettingsPageRoute extends _i4.PageRouteInfo<SettingsPageRouteArgs> {
  SettingsPageRoute({_i5.Key? key})
      : super(SettingsPageRoute.name,
            path: 'settings-page', args: SettingsPageRouteArgs(key: key));

  static const String name = 'SettingsPageRoute';
}

class SettingsPageRouteArgs {
  const SettingsPageRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'SettingsPageRouteArgs{key: $key}';
  }
}
