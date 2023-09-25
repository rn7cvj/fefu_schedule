import 'dart:math';

import 'package:fefu_schedule/controllers/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).shortestSide;
    width = min(width, 600);
    return SizedBox(
      width: width,
      child: Observer(builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: settingsController.themeColorsList
              .map(
                (color) => ColorButton(
                  color: color,
                  onTap: () {
                    settingsController.changeColor(color);
                  },
                  child: settingsController.selectedColor == color
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : null,
                ),
              )
              .toList(),
        );
      }),
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({super.key, required this.color, required this.onTap, this.child});

  final Color color;

  final VoidCallback onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: child,
      ),
    );
  }
}
