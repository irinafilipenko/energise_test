import 'dart:ui';
import 'package:energise_test/lang/de.dart';
import 'package:energise_test/lang/en.dart';
import 'package:energise_test/lang/fr.dart';
import 'package:get/get.dart';

class LocalizationService extends Translations {
  static const fallbackLocale = Locale('en');

  static const locales = [
    Locale('en'),
    Locale('fr'),
    Locale('de'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'fr': fr,
        'de': de,
      };
}
