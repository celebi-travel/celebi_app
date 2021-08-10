import 'package:flutter/material.dart';

SizedBox buildContinueButton(
  String title,
) {
  return SizedBox(
    height: 60,
    width: 300,
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFB6DAE6)),
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Color(0xFF6AADA4),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    ),
  );
}
