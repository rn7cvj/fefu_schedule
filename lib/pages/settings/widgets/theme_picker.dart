import 'dart:math';

import 'package:fefu_schedule/controllers/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ThemePicker extends StatelessWidget {
  const ThemePicker({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).shortestSide;
    width = min(width, 600);

    Color selectedButtonColor = Theme.of(context).colorScheme.primaryContainer;
    Color unselectedButtonColor = Theme.of(context).colorScheme.primary;

    Color selectedButtonContentColor = Theme.of(context).colorScheme.onPrimaryContainer;
    Color unselectedButtonContentColor = Theme.of(context).colorScheme.onPrimary;

    return SizedBox(
      width: width,
      child: Observer(
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  child: ThemeButton(
                    backgroundColor: settingsController.selectedThemeMode == ThemeMode.system
                        ? selectedButtonColor
                        : unselectedButtonColor,
                    icon: Icons.android,
                    iconColor: settingsController.selectedThemeMode == ThemeMode.system
                        ? selectedButtonContentColor
                        : unselectedButtonContentColor,
                    label: Text(
                      "System",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: settingsController.selectedThemeMode == ThemeMode.system
                                ? selectedButtonContentColor
                                : unselectedButtonContentColor,
                          ),
                    ),
                    onTap: () => settingsController.changeTheme(ThemeMode.system),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  child: ThemeButton(
                    backgroundColor: settingsController.selectedThemeMode == ThemeMode.dark
                        ? selectedButtonColor
                        : unselectedButtonColor,
                    icon: Icons.dark_mode,
                    iconColor: settingsController.selectedThemeMode == ThemeMode.dark
                        ? selectedButtonContentColor
                        : unselectedButtonContentColor,
                    label: Text(
                      "Dark",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: settingsController.selectedThemeMode == ThemeMode.dark
                                ? selectedButtonContentColor
                                : unselectedButtonContentColor,
                          ),
                    ),
                    onTap: () => settingsController.changeTheme(ThemeMode.dark),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  child: ThemeButton(
                    backgroundColor: settingsController.selectedThemeMode == ThemeMode.light
                        ? selectedButtonColor
                        : unselectedButtonColor,
                    icon: Icons.light_mode,
                    iconColor: settingsController.selectedThemeMode == ThemeMode.light
                        ? selectedButtonContentColor
                        : unselectedButtonContentColor,
                    label: Text(
                      "Light",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: settingsController.selectedThemeMode == ThemeMode.light
                                ? selectedButtonContentColor
                                : unselectedButtonContentColor,
                          ),
                    ),
                    onTap: () => settingsController.changeTheme(ThemeMode.light),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ThemeButton extends StatelessWidget {
  const ThemeButton(
      {super.key,
      required this.backgroundColor,
      required this.label,
      required this.icon,
      required this.iconColor,
      required this.onTap});

  final Color backgroundColor;
  final Text label;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 42,
              color: iconColor,
            ),
            label
          ],
        ),
      ),
    );
  }
}
