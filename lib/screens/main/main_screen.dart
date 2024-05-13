import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:energise_test/components/navigator_bar_bottom.dart';
import 'package:energise_test/screens/device/device_screen.dart';
import 'package:energise_test/screens/main/main_controller.dart';
import 'package:energise_test/screens/profile/profile_screen.dart';
import 'package:energise_test/screens/timer/timer_screen.dart';

class MainScreen extends GetView<MainController> {
  static String routeName = '/main';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Obx(() {
        return IndexedStack(
          index: controller.currentIndexScreen.value,
          children: const [
            TimerScreen(),
            DeviceScreen(),
            ProfileScreen(),
          ],
        );
      }),
      bottomNavigationBar: NavigatorBar(
        screen: controller.currentIndexScreen.value,
        callback: (value) {
          controller.currentIndexScreen.value = value;
        },
      ),
    );
  }
}
