import 'package:flutter/material.dart';

Padding buildContinueButton(String title, Function onPressed) {
  return Padding(
    padding: EdgeInsets.only(
      top: 40,
    ),
    child: SizedBox(
        height: 55,
        width: 330,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF6AADA4)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ))),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        )),
  );
}
