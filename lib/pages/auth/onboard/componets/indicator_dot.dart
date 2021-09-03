import 'package:flutter/material.dart';

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 20,
      decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.orange.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
