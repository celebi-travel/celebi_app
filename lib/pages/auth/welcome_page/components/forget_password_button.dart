import 'package:celebi_project/pages/auth/forget_password/forget_pass_view.dart';
import 'package:flutter/material.dart';

TextButton buildForgetPasswordButton(context) {
  return TextButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordPage()));
    },
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
