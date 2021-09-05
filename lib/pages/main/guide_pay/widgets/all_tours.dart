import 'package:flutter/material.dart';

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
