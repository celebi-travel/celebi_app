import 'package:celebi_project/constants/preferences_keys.dart';
import 'package:hive/hive.dart';

/// Eğer auth manager gibi bir servis yazılacaksa
/// Locale managerdan inherit edilir. ve providera bağlanılır.
///
/// abstract yapılabilir bence
class LocaleManager {
  static final LocaleManager _instance = LocaleManager._init();
  Box? box;
  static LocaleManager get instance => _instance;

  LocaleManager._init();
  static Future preferencesInit() async {
    instance.box ??= await Hive.openBox('settings');
  }

  Future<void> clearAll() async {
    await box!.clear();
  }

  Future<void> setStringValue(PreferencesKeys key, String value) async {
    await box!.put(key.toString(), value);
  }

  Future<void> setBoolValue(PreferencesKeys key, bool value) async {
    await box!.put(key.toString(), value);
  }

  String? getStringValue(PreferencesKeys key) => box!.get(key.toString());

  bool? getBoolValue(PreferencesKeys key) => box!.get(key.toString());
}
