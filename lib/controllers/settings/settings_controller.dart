import 'package:fefu_schedule/controllers/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part '../../gen/controllers/settings/settings_controller.g.dart';

class SettingsController = SettingsControllerStorage with _$SettingsController;

abstract class SettingsControllerStorage with Store {
  final ThemeContoller _themeContoller = GetIt.I<ThemeContoller>();

  SettingsControllerStorage() {
    selectedThemeMode = _themeContoller.theme;
    selectedColor = _themeContoller.themeColor;
  }

  @action
  void changeTheme(ThemeMode newTheme) {
    selectedThemeMode = newTheme;
    _themeContoller.changeTheme(newTheme);
  }

  @action
  void changeColor(Color newColor) {
    selectedColor = newColor;
    _themeContoller.changeThemeColor(newColor);
  }

  @observable
  late ThemeMode selectedThemeMode;

  @observable
  late Color selectedColor;

  List<Color> themeColorsList = [
    const Color.fromRGBO(9, 103, 176, 1),
    Colors.amber,
    Colors.purple,
    Colors.grey,
    Colors.green,
    Colors.lightBlue,
  ];
}
