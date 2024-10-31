import 'package:shared_preferences/shared_preferences.dart';

late final AppSettings appSettings;

class AppSettings {
  AppSettings._(this._languageCode);

  static const _languageCodeKey = "language";

  late String _languageCode;

  String get language => _languageCode;

  set language(String languageCode) {
    _languageCode = languageCode;
    _save(
      key: _languageCodeKey,
      value: _languageCode,
    );
  }

  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    appSettings = AppSettings._(
      sharedPreferences.getString(_languageCodeKey) ?? 'ru',
    );
  }

  Future<void> _save({required String key, required String value}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }
}
