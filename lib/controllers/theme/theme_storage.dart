import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class ThemeStorage {
  late GetStorage _box;

  static const String _boxName = "themeBox";

  ThemeMode get theme => _theme;
  ThemeMode _theme = ThemeMode.system;
  static const String _themeName = "theme";

  Color get themeColor => _themeColor;
  Color _themeColor = const Color.fromRGBO(9, 103, 176, 1);
  static const String _themeColorName = "themeColor";

  Future<void> init() async {
    await GetStorage.init(_boxName);
    _box = GetStorage(_boxName);

    _theme = _box.read(_themeName) ?? _theme;
    _themeColor = _box.read(_themeColorName) ?? _themeColor;
  }

  Future<void> writeNewTheme(ThemeMode newTheme) async {
    _theme = newTheme;
    _box.write(_themeName, newTheme);
  }

  Future<void> writeNewThemeColor(Color newColor) async {
    _themeColor = newColor;
    _box.write(_themeColorName, newColor);
  }
}
