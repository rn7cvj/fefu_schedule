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
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    icon: Icons.android,
                    iconColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    label: Text(
                      "System",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  child: ThemeButton(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: Icons.dark_mode,
                    iconColor: Theme.of(context).colorScheme.onPrimary,
                    label: Text(
                      "Dark",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 200),
                  child: ThemeButton(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    icon: Icons.light_mode,
                    iconColor: Theme.of(context).colorScheme.onPrimary,
                    label: Text(
                      "Light",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    onTap: () {},
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
      child: Container(
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
