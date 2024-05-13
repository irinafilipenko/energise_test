import 'package:energise_test/bindings.dart';
import 'package:energise_test/screens/device/device_screen.dart';
import 'package:energise_test/screens/main/main_screen.dart';
import 'package:energise_test/screens/profile/profile_screen.dart';
import 'package:energise_test/screens/timer/timer_screen.dart';
import 'package:get/get.dart';

class AppScreen {
  static final routes = [
    GetPage(
      name: MainScreen.routeName,
      page: () => const MainScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: TimerScreen.routeName,
      page: () => const TimerScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: DeviceScreen.routeName,
      page: () => const DeviceScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: ProfileScreen.routeName,
      page: () => const ProfileScreen(),
      binding: Binding(),
    ),
  ];
}
