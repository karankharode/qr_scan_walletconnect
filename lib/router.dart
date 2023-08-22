import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_scan/presentation/screens/home/home_screen.dart';
import 'package:qr_scan/presentation/screens/intro/splash_screen.dart';
import 'package:qr_scan/presentation/screens/scan/scan_screen.dart';

@LazySingleton()
class Routes {
  static const String splashScreen = '/';
  static const String homeScreen = '/home';
  static const String scan = '/scan';

  String currentScreen = splashScreen;

  Route<dynamic>? onGenerate(RouteSettings settings) {
    print("Routes.onGenerate ${settings.name}");
    switch (settings.name) {
      case splashScreen:
        return _getRoute(
          const SplashScreen(),
          settings,
        );

      case homeScreen:
        return _getRoute(
          const HomeScreen(),
          settings,
        );

      case scan:
        return _getRoute(
          const ScanScreen(),
          settings,
        );

      default:
        return _getRoute(
          const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
          settings,
        );
    }
  }

  Route<dynamic>? _getRoute(Widget widget, RouteSettings settings) {
    currentScreen = settings.name!;
    return CupertinoPageRoute(builder: (_) => widget, settings: settings);
  }
}
