import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterCategory {
  final String categoryName;
  final IconData categoryIcon;
  final Color categoryColor;
  final Widget goPage;
  bool isSelected;

  FilterCategory({
    required this.categoryName,
    required this.categoryIcon,
    required this.categoryColor,
    required this.goPage,
    required this.isSelected,
  });
}

List<FilterCategory> filterCategories = [
  FilterCategory(
    categoryName: 'Tours',
    categoryIcon: Icons.hotel, //local_hotel
    categoryColor: Colors.blueAccent,
    goPage: Container(),
    isSelected: false,
  ),
  FilterCategory(
    categoryName: 'Outdoors',
    categoryIcon: Icons.outdoor_grill,
    categoryColor: Colors.indigo,
    goPage: Container(),
    isSelected: false,
  ),
  FilterCategory(
    categoryName: 'Entertainment',
    categoryIcon: Icons.golf_course,
    categoryColor: Colors.redAccent,
    goPage: Container(),
    isSelected: false,
  ),
  FilterCategory(
    categoryName: 'History',
    categoryIcon: Icons.account_balance,
    categoryColor: Colors.brown,
    goPage: Container(),
    isSelected: false,
  ),
];
