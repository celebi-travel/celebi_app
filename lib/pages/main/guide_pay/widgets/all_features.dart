import 'package:flutter/material.dart';

Column buildAllFeatures() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 90, top: 20),
        child: Text(
          "Features",
          style: TextStyle(
              color: Colors.teal.shade200,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      buildFeaturestType(Icons.airplanemode_active, "Airport Pick Up"),
      buildFeaturestType(Icons.airport_shuttle, "Driving"),
      buildFeaturestType(Icons.shopping_cart, "Shopping"),
      buildFeaturestType(Icons.local_bar, "Night Life & Bars"),
      buildFeaturestType(Icons.restaurant_menu, "Food & Restaruant"),
      buildFeaturestType(Icons.museum, "Art & Museum"),
      buildFeaturestType(Icons.pedal_bike_outlined, "Sports & Recreation"),
    ],
  );
}

buildFeaturestType(IconData icon, String title) {
  return Padding(
    padding: EdgeInsets.only(top: 5, left: 90),
    child: Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 12),
          child: Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
