import 'package:energise_test/components/rate_dialog.dart';
import 'package:energise_test/components/web_view_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void showAppRatingAlert() {
    Get.defaultDialog(
      title: "Rate App".tr,
      content: RateDialog(),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Submit".tr),
        ),
      ],
    );
  }

  contactUs(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebViewPage(
          html:
              'https://energise.notion.site/Flutter-f86d340cadb34e9cb1ef092df4e566b7',
          title: 'Contact us'.tr,
          uri: false,
        ),
      ),
    );
  }
}
