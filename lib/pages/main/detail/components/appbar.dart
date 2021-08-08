import 'package:flutter/material.dart';

buildAppBar() {
  return AppBar(
    elevation: 0.0,
    bottomOpacity: 0.0,
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.chevron_left,
        color: Colors.black,
      ),
    ),
    actions: [
      Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_active),
              color: Colors.black),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Colors.black),
        ],
      )
    ],
  );
}
