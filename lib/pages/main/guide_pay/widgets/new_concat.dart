import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

buildSecurityAndNewContactInfo() {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              "Security Checks",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Row(
              children: [
                Icon(
                  FontAwesome.ok,
                  color: Colors.green,
                ),
                Text("Valid Mobile Phone", style: TextStyle(fontSize: 10)),
              ],
            ),
            Row(
              children: [
                Icon(
                  FontAwesome.ok,
                  color: Colors.green,
                ),
                Text("Valid Mobile Phone", style: TextStyle(fontSize: 10)),
              ],
            )
          ],
        ),
        Column(
          children: [
            Text(
              "New Contact",
              style: TextStyle(
                  color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              "+905555-555-5555",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            Text(
              "malikBudak@gmail.com",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
