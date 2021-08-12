import 'package:flutter/material.dart';

Stack buildImage(String image) {
  return Stack(
    children: [
      Image.asset(
        image,
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
            color: Colors.white,
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
