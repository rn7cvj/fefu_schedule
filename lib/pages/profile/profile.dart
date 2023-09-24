import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Icon(
        Icons.person,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        size: MediaQuery.sizeOf(context).shortestSide / 2,
      ),
    );
  }
}
