import 'package:celebi_project/pages/main/restaruant_page/source/drop_down_list.dart';
import 'package:flutter/material.dart';

class ReservationBar extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReservationBar> {
  String dropdownvalue = '1';
  String dropdownvalue2 = 'Monday';
  String dropdownvalue3 = '12:00';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(width: double.infinity),
          Row(
            children: [
              Icon(Icons.accessibility, color: Colors.black, size: 40),
              DropdownButton(
                value: dropdownvalue,
                icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF94C4BE)),
                items: items.map((String item) {
                  return DropdownMenuItem(
                      value: item,
                      child: Text("  $item ",
                          style: TextStyle(
                              color: Color(0xFF94C4BE),
                              fontWeight: FontWeight.bold,
                              fontSize: 20)));
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
              Icon(Icons.calendar_today, color: Colors.black, size: 40),
              DropdownButton(
                value: dropdownvalue2,
                icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF94C4BE)),
                items: items2.map((String item2) {
                  return DropdownMenuItem(
                      value: item2,
                      child: Text("  $item2",
                          style: TextStyle(
                              color: Color(0xFF94C4BE),
                              fontWeight: FontWeight.bold,
                              fontSize: 20)));
                }).toList(),
                onChanged: (String? dayValue) {
                  setState(() {
                    dropdownvalue2 = dayValue!;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.access_time_filled, color: Colors.black, size: 40),
              DropdownButton(
                value: dropdownvalue3,
                icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFF94C4BE)),
                items: items3.map((String item3) {
                  return DropdownMenuItem(
                      value: item3,
                      child: Text("  $item3 ",
                          style: TextStyle(
                              color: Color(0xFF94C4BE),
                              fontWeight: FontWeight.bold,
                              fontSize: 20)));
                }).toList(),
                onChanged: (String? timeValue) {
                  setState(() {
                    dropdownvalue3 = timeValue!;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
