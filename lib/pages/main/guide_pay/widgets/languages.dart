import 'package:flutter/material.dart';

Column buildAllLanguages() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        "Languages",
        style: TextStyle(
            color: Colors.teal.shade200,
            fontWeight: FontWeight.bold,
            fontSize: 18),
      ),
      buildLanguages("icons/flags/png/gb.png", " English"),
      buildLanguages("icons/flags/png/fr.png", " French"),
      buildLanguages("icons/flags/png/ru.png", " Russian")
    ],
  );
}

buildLanguages(String assetImage, String countryName) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Row(
      children: [
        Image.asset(
          assetImage,
          package: 'country_icons',
          height: 30,
          width: 40,
        ),
        Text(countryName,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
