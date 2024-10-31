import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationsExtension on BuildContext {
  String get currentLocale => Localizations.localeOf(this).languageCode;

  List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  AppLocalizations get strings => AppLocalizations.of(this)!;
}
