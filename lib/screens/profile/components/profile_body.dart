import 'package:energise_test/components/custom_button.dart';

import 'package:energise_test/screens/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ProfileBody extends GetView<ProfileController> {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Rate App'.tr,
              onPressed: () {
                controller.showAppRatingAlert();
              },
            ),
            CustomButton(
              label: 'Share App'.tr,
              onPressed: () async {
                Share.share('Share content'.tr);
              },
            ),
            CustomButton(
              label: 'Contact us'.tr,
              onPressed: () {
                controller.contactUs(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
