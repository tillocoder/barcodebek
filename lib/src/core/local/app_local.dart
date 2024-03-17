import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;
  AppLocalization(this.locale);
  late Map<String, String> _languagesValue;
  static AppLocalization of(BuildContext context) => Localizations.of(context, AppLocalization);

  Future<AppLocalization> load() async {
    final String stringValue = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedjson = jsonDecode(stringValue) as Map<String, dynamic>;
    _languagesValue = mappedjson.map((key, value) => MapEntry(key, value.toString()));
    return this;
  }

  String tr(String key) => _languagesValue[key]!;

  static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();
  @override
  bool isSupported(Locale locale) => ['en', 'ru', 'uz'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async => SynchronousFuture<AppLocalization>(await AppLocalization(locale).load());

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}
