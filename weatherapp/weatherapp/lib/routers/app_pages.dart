
import 'package:get/get.dart';
import 'package:weatherapp/routers/app_routes.dart';
import 'package:weatherapp/screens/dashboard_screen.dart';
import 'package:weatherapp/screens/splash/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => SplashScreen(),
        transition: Transition.native),
   
    GetPage(
      name: AppRoutes.useDashboard,
      page: () => DashboardScreen(),
      transition: Transition.fade,
    ),
    
  ];
}
