import 'package:flutter/material.dart';

bookNowButton() {
  String bookNowTitle = "Book Now";
  return Padding(
    padding: EdgeInsets.only(left: 245, top: 20),
    child: ElevatedButton(
      onPressed: () {},
      child: Text(bookNowTitle),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all(Colors.teal[200])),
    ),
  );
}
