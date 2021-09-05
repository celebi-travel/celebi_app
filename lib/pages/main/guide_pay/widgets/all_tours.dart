import 'package:flutter/material.dart';

class AllTours extends StatefulWidget {
  const AllTours({Key? key}) : super(key: key);

  @override
  _AllToursState createState() => _AllToursState();
}

class _AllToursState extends State<AllTours> {
  int full = 640;
  int city = 772;
  int night = 321;
  int morning = 589;

  String selected = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPriceAndHours(
          selected == 'full' ? Colors.green[300]! : Colors.grey.shade200,
          "$full TL Full day tour",
          "Between 14:00 and 04:00",
          () {
            selected = 'full';
            setState(() {});
          },
        ),
        buildPriceAndHours(
          selected == 'city' ? Colors.green[300]! : Colors.white,
          "$city TL City tour",
          "Between 12:00 and 20:00",
          () {
            selected = 'city';
            setState(() {});
          },
        ),
        buildPriceAndHours(
          selected == 'night' ? Colors.green[300]! : Colors.grey.shade200,
          "$night TL Night tour",
          "Between 20:00 and 04:00",
          () {
            selected = 'night';
            setState(() {});
          },
        ),
        buildPriceAndHours(
          selected == 'morning' ? Colors.green[300]! : Colors.white,
          "$morning TL Morning City tour",
          "Between 09:00 and 14:00",
          () {
            selected = 'morning';
            setState(() {});
          },
        ),
      ],
    );
  }
}

Divider buildDivider() {
  return Divider(
    height: 10,
    color: Colors.black,
  );
}

buildPriceAndHours(
    Color color, String priceTitle, String hourTitle, VoidCallback onTap) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Container(
          color: color,
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                priceTitle,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Text(hourTitle),
            ],
          ),
        ),
      ),
      Container(
        color: Colors.grey,
        height: 2,
      )
    ],
  );
}
