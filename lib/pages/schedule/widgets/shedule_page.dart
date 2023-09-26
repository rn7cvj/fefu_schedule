import 'package:flutter/material.dart';

class ShedulePage extends StatelessWidget {
  const ShedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        EventCard(),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        EventCard(),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        EventCard(),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        EventCard(),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        EventCard(),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        EventCard(),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        EventCard(),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        EventCard(),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
        ),
        EventCard(),
      ]),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Chip(
              label: Text("1"),
            ),
            Chip(
              label: Text("08:30 - 10:00"),
            )
          ],
        ),
        SizedBox(
          height: 160,
          child: Card(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            child: Container(),
          ),
        ),
      ],
    );
  }
}
