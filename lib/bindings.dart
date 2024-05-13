import 'package:energise_test/screens/device/device_controller.dart';
import 'package:energise_test/screens/main/main_controller.dart';
import 'package:energise_test/screens/profile/profile_controller.dart';
import 'package:energise_test/screens/timer/timer_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<TimerController>(
      () => TimerController(),
    );
    Get.lazyPut<DeviceController>(
      () => DeviceController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
