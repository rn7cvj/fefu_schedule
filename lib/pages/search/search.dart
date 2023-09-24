import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Icon(
        Icons.search,
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        size: MediaQuery.sizeOf(context).shortestSide / 2,
      ),
    );
  }
}
