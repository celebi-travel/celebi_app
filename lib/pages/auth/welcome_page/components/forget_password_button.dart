import 'package:flutter/material.dart';

TextButton buildForgetPasswordButton() {
  return TextButton(
    onPressed: () {},
    child: Padding(
      padding: EdgeInsets.only(left: 170),
      child: Text(
        'Forget Password',
        style: TextStyle(
          color: Color(0xFF415486),
          fontSize: 15,
        ),
      ),
    ),
  );
}
