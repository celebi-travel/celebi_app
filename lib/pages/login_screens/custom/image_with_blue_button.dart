import 'package:flutter/material.dart';

Stack buildForgetPasswordImage() {
  return Stack(
    children: [
      Image.asset(
        "asset/images/forget_password.png",
        width: double.infinity,
      ),
      Positioned(
        top: 20,
        left: 20,
        child: Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFCDD8F1),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.navigate_before,
              color: Colors.black,
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    ],
  );
}
