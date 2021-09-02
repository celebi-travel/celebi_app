import 'package:flutter/material.dart';

buildNewContactInfo() {
  return Padding(
    padding: EdgeInsets.only(top: 20, left: 180),
    child: Column(
      children: [
        Text(
          "New Contact",
          style: TextStyle(
              color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(
          "+905555-555-5555",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
        Text(
          "malikBudak@gmail.com",
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ],
    ),
  );
}
