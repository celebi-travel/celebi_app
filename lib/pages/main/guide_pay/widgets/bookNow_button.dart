import 'package:flutter/material.dart';

bookNowButton(context) {
  String bookNowTitle = "Book Now";
  return Padding(
    padding: EdgeInsets.only(left: 245, top: 20),
    child: ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0XFFB6E7DA),
            content: Text(
              'Booked',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
      child: Text(bookNowTitle),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all(Colors.teal[200])),
    ),
  );
}
