import 'package:flutter/material.dart';

class GroupPicker extends StatelessWidget {
  const GroupPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Card(
          child: Text("Выберетие группу"),
        )),
        Expanded(child: DropdownMenu(dropdownMenuEntries: [])),
      ],
    );
  }
}
