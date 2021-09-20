import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterCategory {
  final String categoryName;
  final IconData categoryIcon;
  final Color categoryColor;
  final Widget goPage;
  bool isSelected;

  String asset;

  FilterCategory({
    required this.categoryName,
    required this.categoryIcon,
    required this.categoryColor,
    required this.goPage,
    required this.isSelected,
    this.asset = '',
  });
}

List<FilterCategory> filterCategories = [
  FilterCategory(
    categoryName: 'Guide',
    categoryIcon: Icons.hotel, //local_hotel
    categoryColor: Color(0xFF8BCC78),
    goPage: Container(),
    isSelected: false,
    asset: 'asset/icons/guide.png',
  ),
  FilterCategory(
    categoryName: 'Outdoors',
    categoryIcon: Icons.nature_people,
    categoryColor: Color(0xFFF7685E),
    goPage: Container(),
    isSelected: false,
  ),
  FilterCategory(
    categoryName: 'Entertainment',
    categoryIcon: Icons.golf_course,
    categoryColor: Color(0xFFAF78CF),
    goPage: Container(),
    isSelected: false,
  ),
  FilterCategory(
    categoryName: 'History',
    categoryIcon: Icons.account_balance,
    categoryColor: Color(0xFF966238),
    goPage: Container(),
    isSelected: false,
  ),
];
