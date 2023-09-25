// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../controllers/theme/theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeContoller on ThemeControllerStorage, Store {
  late final _$themeAtom =
      Atom(name: 'ThemeControllerStorage.theme', context: context);

  @override
  ThemeMode get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeMode value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$themeColorAtom =
      Atom(name: 'ThemeControllerStorage.themeColor', context: context);

  @override
  Color get themeColor {
    _$themeColorAtom.reportRead();
    return super.themeColor;
  }

  @override
  set themeColor(Color value) {
    _$themeColorAtom.reportWrite(value, super.themeColor, () {
      super.themeColor = value;
    });
  }

  late final _$ThemeControllerStorageActionController =
      ActionController(name: 'ThemeControllerStorage', context: context);

  @override
  void changeTheme(ThemeMode newTheme) {
    final _$actionInfo = _$ThemeControllerStorageActionController.startAction(
        name: 'ThemeControllerStorage.changeTheme');
    try {
      return super.changeTheme(newTheme);
    } finally {
      _$ThemeControllerStorageActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeThemeColor(Color newColor) {
    final _$actionInfo = _$ThemeControllerStorageActionController.startAction(
        name: 'ThemeControllerStorage.changeThemeColor');
    try {
      return super.changeThemeColor(newColor);
    } finally {
      _$ThemeControllerStorageActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
theme: ${theme},
themeColor: ${themeColor}
    ''';
  }
}
