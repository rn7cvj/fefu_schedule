import 'package:fefu_schedule/i18n/strings.g.dart';
import 'package:fefu_schedule/navigation/navigator.dart';
import 'package:fefu_schedule/pages/profile/widgets/group_picker.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Ваша группа",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                ),
              ),
              GroupPicker(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "settings",
        onPressed: () => AppNavigator.goToSettings(),
        child: const Icon(Icons.settings),
      ),
    );
  }
}
