import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/sub_heading_text.dart';

class AppListTile extends StatelessWidget {
  final String title;
  final IconData? trailingIconData;
  final Widget? trailing;
  final Function()? onTap;
  const AppListTile({
    super.key,
    required this.title,
    this.trailingIconData,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: SubHeadingText(text: title, textAlign: TextAlign.left),
      trailing:
          trailing ??
          (trailingIconData != null
              ? Icon(
                trailingIconData,
                color: theme.colorScheme.onPrimary.withOpacity(0.6),
              )
              : null),
      onTap: onTap,
    );
  }
}
