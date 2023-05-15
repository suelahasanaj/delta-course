import 'package:auto_route/annotations.dart';
import 'package:delta/presentation/pages/auth/auth_page.dart';
import 'package:delta/presentation/pages/home/home_page.dart';
import 'package:delta/presentation/pages/signup/signup_page.dart';

// Script to generate : flutter packages pub run build_runner build --delete-conflicting-outputs

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(path: "/auth", page: AuthPage, initial: true),
    AutoRoute(path: '/signup', page: SignupPage),
    AutoRoute(path: "/", page: HomePage),
  ],
)
class $AppRouter {}
