import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'views/a_page.dart';
import 'views/alert_page.dart';
import 'views/landing_page.dart';
import 'views/layout_page.dart';
import 'views/view_page.dart';

class RoutePaths {
  static const String landingPage = 'Landing page';
  static const String viewPage = 'View page';
  static const String layoutPage = 'Layout page';
  static const String alertPage = 'Alert page';
  static const String aPage = 'A page';
}

mixin Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.landingPage:
        return MaterialPageRoute<void>(builder: (_) => const LandingPage());
      case RoutePaths.viewPage:
        // final event = settings.arguments as Event;
        return MaterialPageRoute<void>(builder: (_) => const ViewPage());
      case RoutePaths.layoutPage:
        return MaterialPageRoute<void>(builder: (_) => const LayoutPage());
      case RoutePaths.alertPage:
        return MaterialPageRoute<void>(builder: (_) => const AlertPage());
      case RoutePaths.aPage:
        return MaterialPageRoute<void>(builder: (_) => const APage());
      default:
        return MaterialPageRoute<void>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('完全沒有畫面：${settings.name}'),
            ),
          ),
        );
    }
  }
}
