import 'package:celebi_project/models/filter_category_model.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required FilterCategory item,
    required this.onPressed,
    required this.isSelected,
    this.size = 90,
  })  : _item = item,
        super(key: key);

  final FilterCategory _item;
  final VoidCallback onPressed;
  final bool isSelected;
  final double size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(children: [
        Stack(
          children: [
            Container(
              height: isSelected ? size : size - 10,
              width: isSelected ? size : size - 10,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _item.categoryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(_item.categoryIcon, size: 40, color: Colors.white),
              ),
            ),
          ],
        ),
        Text(_item.categoryName)
      ]),
    );
  }
}
