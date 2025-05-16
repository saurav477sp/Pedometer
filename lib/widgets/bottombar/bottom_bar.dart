import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/widgets/bottombar/bottombar_item.dart';
import 'package:pedometer/widgets/bottombar/utils/navbar_item_model.dart';

class BottomBar extends StatelessWidget {
  final List<NavbarItemModel> options;
  final int selectedId;
  final Function(int selectedId) onSelect;
  const BottomBar({
    super.key,
    required this.options,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = getSortedOptions();
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 15),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            items.map((items) {
              return BottombarItem(
                isSelected: selectedId == items.id,
                icon: items.icon,
                iconPath: items.iconPath,
                label: items.label,
                selectedIcon: items.selectedIcon,
                selectedIconPath: items.selectedIconPath,
                isLabelVisible: items.isLabelVisible,
                onSelect: () => onSelect(items.id),
              );
            }).toList(),
      ),
    );
  }

  List<NavbarItemModel> getSortedOptions() {
    return options.sortedBy((element) => element.id);
  }
}
