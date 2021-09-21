

  import 'package:flutter/material.dart';

Row buildHeaderFacilities(IconData icon,String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        Text(
          title,
          style: TextStyle(color: Colors.teal[200]),
        ),
      ],
    );
  }

  Row buildFacilities(IconData icon,String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        Text(
          title,
          style: TextStyle(color: Colors.black,fontSize: 10),
        )
      ],
    );
  }
