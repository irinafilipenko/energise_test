// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:energise_test/screens/device/device_model.dart';
import 'package:energise_test/services/localization_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStorageService extends GetxService {
  Locale? languageLocal;
  Rx<DeviceModel> dataCash = DeviceModel(
          status: '',
          country: '',
          countryCode: '',
          region: '',
          regionName: '',
          city: '',
          zip: '',
          lat: 49.8596,
          lon: 18.8923,
          timezone: '',
          isp: '',
          org: '',
          as: '',
          query: '')
      .obs;

  Future init() async {
    await dataLoad();
    return this;
  }

  dataLoad() async {
    final prefs = await SharedPreferences.getInstance();
    dataCash.value = prefs.getString('data_cash') == null
        ? DeviceModel(
            status: '',
            country: '',
            countryCode: '',
            region: '',
            regionName: '',
            city: '',
            zip: '',
            lat: 49.8596,
            lon: 18.8923,
            timezone: '',
            isp: '',
            org: '',
            as: '',
            query: '')
        : dataFromJson(prefs.getString('data_cash')!);

    if (prefs.getString('lang') == "english") {
      languageLocal = LocalizationService.locales[0];
    } else if (prefs.getString('lang') == "français") {
      languageLocal = LocalizationService.locales[1];
    } else if (prefs.getString('lang') == "deutsch") {
      languageLocal = LocalizationService.locales[2];
    } else {
      languageLocal = window.locale;
    }
  }

  dataSave() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('data_cash', jsonEncode(dataCash.value));
  }
}
