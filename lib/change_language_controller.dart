import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguageController with ChangeNotifier {
  Locale? _appLocale;

  Locale? get appLocale => _appLocale;

  void changeLanguage(Locale languageType) async {
    log("language code ${languageType}");
    SharedPreferences sp = await SharedPreferences.getInstance();
    _appLocale = languageType;
    if (languageType == const Locale("en")) {
      await sp.setString("language_code", "en");
    } else if (languageType == const Locale("hi")) {
      await sp.setString("language_code", "hi");
    } else if (languageType == const Locale("es")) {
      await sp.setString("language_code", "es");
    }
    notifyListeners();
  }
}
