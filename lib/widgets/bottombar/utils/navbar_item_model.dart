import 'package:flutter/widgets.dart';

class NavbarItemModel {
  final IconData? icon;
  final IconData? selectedIcon;
  final String iconPath;
  final String selectedIconPath;
  final bool isSelected;
  final String label;
  final bool isLabelVisible;
  final bool isDesable;
  final int id;
  final bool allowAppBar;
  final Widget Function()? getWidget;

  NavbarItemModel({
    this.icon,
    this.selectedIcon,
    this.iconPath = '',
    this.selectedIconPath = '',
    this.isSelected = false,
    this.label = '',
    this.isLabelVisible = false,
    this.isDesable = true,
    required this.id,
    this.allowAppBar = false,
    this.getWidget,
  });
}
