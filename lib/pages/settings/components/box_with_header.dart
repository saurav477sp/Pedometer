import 'package:flutter/material.dart';
import 'package:pedometer/widgets/text/label_text.dart';

class BoxWithHeader extends StatelessWidget {
  final String? headingText;
  final List<Widget> widgetList;
  const BoxWithHeader({
    super.key,
    this.headingText = '',
    this.widgetList = const [],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(text: headingText ?? '', fontWeight: FontWeight.w500),
        SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.tertiary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(children: widgetList),
        ),
      ],
    );
  }
}
