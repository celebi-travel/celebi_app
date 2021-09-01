import 'package:flutter/material.dart';

class SettingsElement extends StatelessWidget {
  const SettingsElement({
    Key? key,
    required this.name,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.grey[300]),
        padding: EdgeInsets.all(4),
        child: Icon(icon),
      ),
      trailing: IconButton(onPressed: onPressed, icon: Icon(Icons.keyboard_arrow_right)),
      title: Text(name),
    );
  }
}
