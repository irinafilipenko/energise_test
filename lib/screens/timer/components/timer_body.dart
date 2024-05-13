import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:energise_test/screens/timer/timer_controller.dart';

class TimerBody extends GetView<TimerController> {
  const TimerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Center(
            child: AnimatedBuilder(
              animation: controller.buttonScaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: controller.buttonScaleAnimation.value,
                  child: ElevatedButton(
                    onPressed: controller.togglePlayPause,
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(30.0),
                    ),
                    child: Obx(() => Icon(
                          controller.isPlaying.value
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 50.0,
                        )),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            left: MediaQuery.of(context).size.width / 3.5,
            child: AnimatedBuilder(
              animation: controller.timerScaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: controller.timerScaleAnimation.value,
                  child: Obx(() => Text(
                        controller.timerTime.value,
                        style: const TextStyle(fontSize: 40.0),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
