import 'package:flutter/material.dart';

class LocalizationInit {
  final List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR')
  ];
  final String localizationPath = 'assets/translations';
}
