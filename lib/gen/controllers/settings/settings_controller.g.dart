// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../controllers/settings/settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsController on SettingsControllerStorage, Store {
  late final _$selectedThemeModeAtom = Atom(
      name: 'SettingsControllerStorage.selectedThemeMode', context: context);

  @override
  ThemeMode get selectedThemeMode {
    _$selectedThemeModeAtom.reportRead();
    return super.selectedThemeMode;
  }

  @override
  set selectedThemeMode(ThemeMode value) {
    _$selectedThemeModeAtom.reportWrite(value, super.selectedThemeMode, () {
      super.selectedThemeMode = value;
    });
  }

  late final _$selectedColorAtom =
      Atom(name: 'SettingsControllerStorage.selectedColor', context: context);

  @override
  Color get selectedColor {
    _$selectedColorAtom.reportRead();
    return super.selectedColor;
  }

  @override
  set selectedColor(Color value) {
    _$selectedColorAtom.reportWrite(value, super.selectedColor, () {
      super.selectedColor = value;
    });
  }

  @override
  String toString() {
    return '''
selectedThemeMode: ${selectedThemeMode},
selectedColor: ${selectedColor}
    ''';
  }
}
