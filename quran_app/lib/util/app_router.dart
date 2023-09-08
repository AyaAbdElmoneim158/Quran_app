import 'package:get/get.dart';
import 'package:quran_app/features/bottom_bar.dart';
import 'package:quran_app/features/splash/screen/splash_screen.dart';

class Routes {
  static String splashScreen = '/';
  static String bottomBar = '/bottomBar';
}

List<GetPage<dynamic>>? getPages = [
  GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      transition: Transition.zoom),
  GetPage(name: Routes.bottomBar, page: () => const BottomBar()),
];
