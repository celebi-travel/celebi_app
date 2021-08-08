import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterCategory {
  final String categoryName;
  final IconData categoryIcon;
  final Color categoryColor;
  final Widget goPage;

  FilterCategory({required this.categoryName, required this.categoryIcon, required this.categoryColor, required this.goPage});
}

List<FilterCategory> filterCategories = [
  FilterCategory(
    categoryName: 'Hotels',
    categoryIcon: Icons.hotel, //local_hotel
    categoryColor: Colors.blueAccent,
    goPage: Container(),
  ),
  FilterCategory(
    categoryName: 'Outdoors',
    categoryIcon: Icons.outdoor_grill,
    categoryColor: Colors.indigo,
    goPage: Container(),
  ),
  FilterCategory(
    categoryName: 'Food & Drink',
    categoryIcon: Icons.restaurant,
    categoryColor: Colors.pinkAccent,
    goPage: Container(),
  ),
  FilterCategory(
    categoryName: 'Entertainment',
    categoryIcon: Icons.golf_course,
    categoryColor: Colors.redAccent,
    goPage: Container(),
  ),
  FilterCategory(
    categoryName: 'History',
    categoryIcon: Icons.account_balance,
    categoryColor: Colors.brown,
    goPage: Container(),
  ),
];
