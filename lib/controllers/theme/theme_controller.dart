import 'package:fefu_schedule/controllers/theme/theme_storage.dart';
import 'package:fefu_schedule/logger.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part '../../gen/controllers/theme/theme_controller.g.dart';

class ThemeContoller = ThemeControllerStorage with _$ThemeContoller;

abstract class ThemeControllerStorage with Store {
  ThemeControllerStorage({required ThemeStorage themeStorage}) : _themeStorage = themeStorage;

  final ThemeStorage _themeStorage;

  Future<void> init() async {
    await _themeStorage.init();

    logger.i(_themeStorage.theme);
    logger.i(_themeStorage.themeColor);

    changeTheme(_themeStorage.theme);
    // changeThemeColor(_themeStorage.themeColor);
  }

  @action
  void changeTheme(ThemeMode newTheme) {
    _themeStorage.writeNewTheme(newTheme);
    theme = newTheme;
  }

  @action
  void changeThemeColor(Color newColor) {
    _themeStorage.writeNewThemeColor(newColor);
    themeColor = newColor;
  }

  @observable
  ThemeMode theme = ThemeMode.system;

  @observable
  Color themeColor = const Color.fromRGBO(9, 103, 176, 1);
}
