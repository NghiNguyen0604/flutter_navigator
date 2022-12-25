import 'package:flutter/material.dart';

class NavBarTabItem extends BottomNavigationBarItem {
  const NavBarTabItem(
      {required this.path,
      required this.name,
      required Widget icon,
      String? label})
      : super(icon: icon, label: label);
  final String path;
  final String name;
}
