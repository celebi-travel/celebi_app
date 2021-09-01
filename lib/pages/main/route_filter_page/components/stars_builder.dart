import 'package:flutter/material.dart';

class StarsBuilder extends StatelessWidget {
  const StarsBuilder(
    this.starsNumber, {
    Key? key,
  }) : super(key: key);

  final int starsNumber;

  @override
  Widget build(BuildContext context) {
    if (starsNumber == 1) {
      return Container(
        width: 90,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.grey[200]),
        height: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
            ],
          ),
        ),
      );
    } else if (starsNumber == 2) {
      return Container(
        width: 90,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.grey[200]),
        height: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
            ],
          ),
        ),
      );
    } else if (starsNumber == 3) {
      return Container(
        width: 90,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.grey[200]),
        height: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
            ],
          ),
        ),
      );
    } else if (starsNumber == 4) {
      return Container(
        width: 90,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.grey[200]),
        height: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.white, size: 16),
            ],
          ),
        ),
      );
    } else if (starsNumber == 5) {
      return Container(
        width: 90,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.grey[200]),
        height: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
              Icon(Icons.star, color: Colors.blue, size: 16),
            ],
          ),
        ),
      );
    }
    return Container();
  }
}
