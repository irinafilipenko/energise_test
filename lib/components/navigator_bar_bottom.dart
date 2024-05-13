// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NavigatorBar extends StatefulWidget {
  late int screen;
  final Function(int) callback;

  NavigatorBar({super.key, required this.screen, required this.callback});

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0, left: 5, right: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        widget.callback(0);
                      },
                      child: const Icon(Icons.timer)),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        widget.callback(1);
                      },
                      child: const Icon(Icons.maps_home_work_outlined)),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        widget.callback(2);
                      },
                      child: const Icon(Icons.contact_mail)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
