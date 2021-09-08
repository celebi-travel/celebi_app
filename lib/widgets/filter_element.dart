import '../models/filter_category_model.dart';
import 'package:flutter/material.dart';

class FilterElement extends StatelessWidget {
  const FilterElement({
    Key? key,
    required FilterCategory item,
    required this.onTap,
    this.size = 80,
  })  : _item = item,
        super(key: key);

  final FilterCategory _item;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Stack(
          children: [
            Container(
              height: size,
              width: size,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _item.categoryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(_item.categoryIcon, size: 40, color: Colors.white),
              ),
            ),
            _item.isSelected
                ? Positioned(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: _item.categoryColor, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Icon(Icons.check,
                                size: 18, color: _item.categoryColor),
                          ),
                        )),
                    top: 3,
                    right: 3,
                  )
                : SizedBox(),
          ],
        ),
        Text(_item.categoryName)
      ]),
    );
  }
}
