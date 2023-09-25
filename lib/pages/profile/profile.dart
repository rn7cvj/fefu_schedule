import 'package:fefu_schedule/i18n/strings.g.dart';
import 'package:fefu_schedule/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Center(
        child: Icon(
          Icons.person,
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          size: MediaQuery.sizeOf(context).shortestSide / 2,
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
