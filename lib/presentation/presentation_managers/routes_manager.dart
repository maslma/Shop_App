import 'package:flutter/material.dart';
import 'package:shop_app/presentation/presentation_managers/string_manager.dart';
import 'package:shop_app/presentation/screens/bottom_navBar/views/bottom_navbar_view.dart';
import 'package:shop_app/presentation/screens/home/views/home_view.dart';
import 'package:shop_app/presentation/screens/login/views/login_view.dart';
import 'package:shop_app/presentation/screens/register/views/register_view.dart';
import 'package:shop_app/presentation/screens/splash/views/splash_views.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboardingRoute';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPasswor';
  static const String mainRoute = '/main';
  static const String storeDetailsRoute = '/storeDetails'; 
  static const String homeRoute = '/home'; 
  static const String navBarRoute = '/navBar'; 
  static const String cateRoute = '/cate'; 
}

class RoutesGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      // case Routes.onboardingRoute:
      //   return MaterialPageRoute(builder: (_) => null);
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.navBarRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
