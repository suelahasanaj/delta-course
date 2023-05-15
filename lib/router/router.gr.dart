// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../presentation/pages/auth/auth_page.dart' as _i1;
import '../presentation/pages/home/home_page.dart' as _i3;
import '../presentation/pages/signup/signup_page.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AuthPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    SignupPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignupPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          AuthPageRoute.name,
          path: '/auth',
        ),
        _i4.RouteConfig(
          SignupPageRoute.name,
          path: '/signup',
        ),
        _i4.RouteConfig(
          HomePageRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.AuthPage]
class AuthPageRoute extends _i4.PageRouteInfo<void> {
  const AuthPageRoute()
      : super(
          AuthPageRoute.name,
          path: '/auth',
        );

  static const String name = 'AuthPageRoute';
}

/// generated route for
/// [_i2.SignupPage]
class SignupPageRoute extends _i4.PageRouteInfo<void> {
  const SignupPageRoute()
      : super(
          SignupPageRoute.name,
          path: '/signup',
        );

  static const String name = 'SignupPageRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i4.PageRouteInfo<void> {
  const HomePageRoute()
      : super(
          HomePageRoute.name,
          path: '/',
        );

  static const String name = 'HomePageRoute';
}
