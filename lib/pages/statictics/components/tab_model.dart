import 'package:flutter/widgets.dart';

class TabModel {
  final int id;
  final String text;
  final Widget? icon;
  final bool isIconVisible;
  final bool isSelected;
  final Widget Function()? getWidget;

  TabModel({
    required this.id,
    required this.text,
    this.icon,
    this.isSelected = false,
    this.getWidget,
    this.isIconVisible = false,
  });
}
