import 'package:fefu_schedule/controllers/settings/settings_controller.dart';
import 'package:fefu_schedule/i18n/strings.g.dart';
import 'package:fefu_schedule/pages/settings/widgets/theme_picker.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  Settings({super.key}) {
    controller = SettingsController();
  }

  late SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "settings",
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      t.settings.theme_picker,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                    ),
                  ),
                ),
                ThemePicker(
                  settingsController: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
