import 'package:flutter/material.dart';
import 'package:nampy_frontend/Views/Auth/LoginPage.dart';
import 'package:nampy_frontend/Views/Auth/SignupPage.dart';
import 'package:nampy_frontend/Views/Auth/StartPage.dart';
import 'package:nampy_frontend/Views/DashboardScreen.dart';
import 'package:nampy_frontend/Views/SplashScreen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case '/':
        page = SplashScreen();
        break;
      case '/start':
        page = StartPage();
        break;
      case '/signup':
        page = SignupPage();
        break;
      case '/login':
        page = const LoginPage();

      case '/dashboard':
        page = const DashboardScreen();
        break;

      default:
        page = const Scaffold(body: Center(child: Text('Page not found')));
    }

    return _fadeSlideRoute(page, settings);
  }

  static PageRouteBuilder _fadeSlideRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (_, animation, __, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(3.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

        final fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: child,
          ),
        );
      },
    );
  }
}
