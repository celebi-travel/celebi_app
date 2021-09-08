import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.name,
    required this.imagePath,
    required this.color,
    required this.avatarColor,
    this.textColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  final String name, imagePath;
  final Color color, avatarColor, textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            minimumSize: MaterialStateProperty.all(Size(double.infinity, 60)),
            shadowColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)))),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: CircleAvatar(
                backgroundColor: avatarColor,
                child: Image.asset(imagePath, scale: 3),
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: textColor,
              ),
            ),
            SizedBox(width: 16)
          ],
        ),
      ),
    );
  }
}
