import 'package:flutter/material.dart';

TextButton buildForgetPasswordButton() {
  return TextButton(
    onPressed: () {},
    child: Padding(
      padding: EdgeInsets.only(left: 180),
      child: Text(
        'Forget Password',
        style: TextStyle(color: Color(0xFF415486)),
      ),
    ),
  );
}
