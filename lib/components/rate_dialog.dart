// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RateDialog extends StatelessWidget {
  RxInt selectedIndex = 0.obs;

  RateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Please rate our app".tr),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => IconButton(
                icon: Icon(
                  index < selectedIndex.value ? Icons.star : Icons.star_border,
                  color:
                      index < selectedIndex.value ? Colors.orange : Colors.grey,
                ),
                onPressed: () {
                  selectedIndex.value = index + 1;
                },
              ),
            ),
          );
        }),
      ],
    );
  }
}
