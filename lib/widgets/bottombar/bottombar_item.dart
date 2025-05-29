import 'package:flutter/material.dart';
import 'package:pedometer/widgets/icons/icon_or_svg.dart';
import 'package:pedometer/widgets/text/label_text.dart';

class BottombarItem extends StatelessWidget {
  final bool isSelected;
  final bool isLabelVisible;
  final Color? selecteBackgroundColor;
  final Color? selectedForgroundColor;
  final IconData? icon;
  final IconData? selectedIcon;
  final String iconPath;
  final String selectedIconPath;
  final String label;
  final VoidCallback onSelect;
  const BottombarItem({
    super.key,
    required this.isSelected,
    this.isLabelVisible = false,
    this.selecteBackgroundColor,
    this.selectedForgroundColor,
    this.icon,
    this.selectedIcon,
    this.iconPath = '',
    this.selectedIconPath = '',
    this.label = '',
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onSelect,
      borderRadius: BorderRadius.circular(1000),
      child: Container(
        height: 60,
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? selecteBackgroundColor ?? theme.colorScheme.primaryContainer
                  : theme.colorScheme.background,
          shape: BoxShape.circle,
        ),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: isSelected ? 1 : 0.7,
          curve: Curves.ease,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconOrSvg(
                icon: isSelected ? selectedIcon : icon,
                iconPath: isSelected ? selectedIconPath : iconPath,
                iconColor:
                    isSelected
                        ? selectedForgroundColor ??
                            theme.colorScheme.onPrimaryContainer
                        : theme.colorScheme.onPrimary.withOpacity(0.7),
                size: isLabelVisible ? 20 : 25,
              ),
              if (isLabelVisible && isSelected) ...[
                const SizedBox(height: 4),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: LabelText(
                    text: label,
                    textOverflow: TextOverflow.visible,
                    color:
                        selectedForgroundColor ??
                        theme.colorScheme.onPrimaryContainer,
                    fontSize: 12,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
