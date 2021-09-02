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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildPriceAndHours(Colors.grey.shade200, "$full TL Full day tour",
            "Between 14:00 and 04:00"),
        buildPriceAndHours(
            Colors.white, "$city TL City tour", "Between 12:00 and 20:00"),
        buildPriceAndHours(Colors.grey.shade200, "$night TL Night tour",
            "Between 20:00 and 04:00"),
        buildPriceAndHours(Colors.white, "$morning TL Morning City tour",
            "Between 09:00 and 14:00"),
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

buildPriceAndHours(Color color, String priceTitle, String hourTitle) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {},
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
