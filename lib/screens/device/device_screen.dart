import 'package:flutter/material.dart';
import 'package:energise_test/screens/device/components/device_body.dart';

class DeviceScreen extends StatelessWidget {
  static String routeName = '/device';

  const DeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DeviceBody(),
    );
  }
}
