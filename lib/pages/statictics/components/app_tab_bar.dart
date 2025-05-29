import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/config/theme/app_color.dart';
import 'package:pedometer/pages/statictics/components/app_tab.dart';
import 'package:pedometer/pages/statictics/components/tab_model.dart';

class AppTabBar extends StatelessWidget {
  final double height;
  final int selectedIndex;
  final List<TabModel> items;
  final Function(int selectedIndex) onTap;
  const AppTabBar({
    super.key,
    this.height = 65,
    required this.selectedIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final componentWidth =
        ((size.width - (2 * (size.width * 0.05)) - 8) / 3) - 3;
    final sortedItems = _sortById();

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: colrs.grey,
        borderRadius: BorderRadius.circular(100),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            sortedItems.map((item) {
              return AppTab(
                isSelected: selectedIndex == item.id,
                width: componentWidth,
                icon: item.icon,
                text: item.text,
                onTap: () => onTap(item.id),
              );
            }).toList(),
      ),
    );
  }

  List<TabModel> _sortById() {
    return items.sortedBy((element) => element.id);
  }
}
