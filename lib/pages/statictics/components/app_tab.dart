import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';

class AppTab extends StatelessWidget {
  final double width;
  final Widget? icon;
  final String text;
  final VoidCallback? onTap;
  final bool isSelected;
  const AppTab({
    super.key,
    required this.isSelected,
    required this.width,
    this.icon,
    this.text = '',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(10000),
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color:
              isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.primary.withOpacity(0.15),
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child:
            icon ??
            BodyTextSmall(
              text: text,
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color:
                  isSelected
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSurface,
            ),
      ),
    );
  }
}
