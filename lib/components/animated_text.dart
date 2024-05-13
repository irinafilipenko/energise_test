import 'package:flutter/material.dart';

Widget animatedText(String text, Color color) {
  return TweenAnimationBuilder<Color?>(
    duration: const Duration(milliseconds: 1500),
    tween: ColorTween(begin: Colors.transparent, end: color),
    builder: (_, Color? value, child) {
      return Text(
        text,
        style: TextStyle(color: value),
      );
    },
  );
}
