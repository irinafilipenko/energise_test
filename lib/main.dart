// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:energise_test/routes.dart';
import 'package:energise_test/screens/main/main_screen.dart';
import 'package:energise_test/services/get_storage_service.dart';
import 'package:energise_test/services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  await Get.putAsync<GetStorageService>(
      () async => await GetStorageService().init());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  GetStorageService getStorageService = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'energise_test',
      locale: getStorageService.languageLocal ?? ui.window.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      defaultTransition: Transition.fade,
      initialRoute: MainScreen.routeName,
      getPages: AppScreen.routes,
      useInheritedMediaQuery: true,
    );
  }
}
