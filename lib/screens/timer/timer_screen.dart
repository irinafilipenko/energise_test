import 'package:energise_test/screens/timer/components/timer_body.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatelessWidget {
  static String routeName = '/timer';

  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TimerBody(),
    );
  }
}
