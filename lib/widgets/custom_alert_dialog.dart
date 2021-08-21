import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({
    Key? key,
    this.title,
    this.width,
    this.height,
    required this.content,
  }) : super(key: key);
  Widget? title;
  final Widget content;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title ?? null,
      content: Container(
          width: width ?? 260.0,
          height: height ?? 100.0,
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color(0xFFFFFF),
            borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
          ),
          child: content),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
    );
  }
}
