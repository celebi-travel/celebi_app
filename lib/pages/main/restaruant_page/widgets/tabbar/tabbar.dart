import '../../source/drop_down_list.dart';
import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DropDownButton> {
  String dropdownvalue = ' ';
  String dropdownvalue2 = ' ';
  String dropdownvalue3 = ' ';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.ac_unit),
                DropdownButton(
                  value: "1",
                  icon:
                      Icon(Icons.keyboard_arrow_down, color: Color(0xFFB6DAE6)),
                  items: items.map((String item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text("$item people",
                            style: TextStyle(color: Color(0xFFB6DAE6))));
                  }).toList(),
                  onChanged: (String? peopleValue) {
                    setState(() {
                      dropdownvalue = peopleValue!;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.ac_unit),
                DropdownButton(
                  value: "1",
                  icon:
                      Icon(Icons.keyboard_arrow_down, color: Color(0xFFB6DAE6)),
                  items: items.map((String item2) {
                    return DropdownMenuItem(
                        value: item2,
                        child: Text("$item2",
                            style: TextStyle(color: Color(0xFFB6DAE6))));
                  }).toList(),
                  onChanged: (String? peopleValue) {
                    setState(() {
                      dropdownvalue = peopleValue!;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.ac_unit),
                DropdownButton(
                  value: "1",
                  icon:
                      Icon(Icons.keyboard_arrow_down, color: Color(0xFFB6DAE6)),
                  items: items.map((String item3) {
                    return DropdownMenuItem(
                        value: item3,
                        child: Text("$item3 people",
                            style: TextStyle(color: Color(0xFFB6DAE6))));
                  }).toList(),
                  onChanged: (String? peopleValue) {
                    setState(() {
                      dropdownvalue = peopleValue!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
