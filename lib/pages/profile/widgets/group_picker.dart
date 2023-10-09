import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class GroupPicker extends StatelessWidget {
   GroupPicker({super.key});

final List<String> items = [
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];
String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 2,
            child: Card(
          child: SizedBox( 
           height: 40,
            child: Center(child: Text("Выберетие группу"))),
        ),),
        Expanded(child: Card(
          child: SizedBox(
            height: 40,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: Text(
                  'Subgroup',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  elevation: 3,
                ),
                items: items
                    .map((String item) => DropdownItem<String>(
                          value: item,
                          height: 40,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (s){},
                // buttonStyleData: const ButtonStyleData(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   height: 40,
                //   width: 140,
                // ),
              ),
            ),
          ),
        ),
      ),
      ],
    );
  }
}
