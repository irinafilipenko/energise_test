import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class TimerController extends GetxController with GetTickerProviderStateMixin {
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  late AnimationController _buttonAnimationController;
  late AnimationController _timerAnimationController;
  late Animation<double> buttonScaleAnimation;
  late Animation<double> timerScaleAnimation;

  RxString timerTime = '00:00:00'.obs;
  RxBool isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    _buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _timerAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    buttonScaleAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_buttonAnimationController);

    timerScaleAnimation =
        Tween<double>(begin: 1.0, end: 1.2).animate(_timerAnimationController);

    _buttonAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _buttonAnimationController.dispose();
    _timerAnimationController.dispose();
    super.dispose();
  }

  void togglePlayPause() {
    isPlaying.value = !isPlaying.value;
    if (isPlaying.value) {
      stopwatch.start();
      timer = Timer.periodic(const Duration(seconds: 1), (_) {
        updateDuration(stopwatch.elapsed);
      });
      _timerAnimationController.repeat(reverse: true);
      _buttonAnimationController.stop();
    } else {
      stopwatch.stop();
      stopwatch.reset();
      timerTime.value = '00:00:00';
      timer?.cancel();
      _buttonAnimationController.repeat(reverse: true);
      _timerAnimationController.stop();
    }
  }

  void updateDuration(Duration elapsedTime) {
    timerTime.value = _formatDuration(elapsedTime);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
