import 'package:flutter/material.dart';

bookNowButton(context, selected) {
  String bookNowTitle = "Book Now";
  return Padding(
    padding: EdgeInsets.only(left: 190, top: 10),
    child: ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0XFFB6E7DA),
            content: Text(
              'Booked, $selected tl',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
      child: Text(
        bookNowTitle,
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all(Colors.teal[200])),
    ),
  );
}
