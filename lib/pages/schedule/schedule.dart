import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Icon(
        Icons.calendar_month_outlined,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        size: MediaQuery.sizeOf(context).shortestSide / 2,
      ),
    );
  }
}
