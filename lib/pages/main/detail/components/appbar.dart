import 'package:flutter/material.dart';

buildAppBar(context) {
  return AppBar(
    elevation: 0.0,
    bottomOpacity: 0.0,
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.chevron_left,
        color: Colors.black,
      ),
    ),
    actions: [],
  );
}
