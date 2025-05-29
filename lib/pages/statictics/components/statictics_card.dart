import 'package:flutter/material.dart';
import 'package:pedometer/widgets/drink%20chart/box_of_bars.dart';
import 'package:pedometer/widgets/icons/icon_or_svg.dart';
import 'package:pedometer/widgets/text/body_text_big.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';

class StaticticsCard extends StatelessWidget {
  final Color? backgroundColor;
  final String iconPath;
  final String title;
  final String bodyText;
  final bool isBodyIconVisible;
  const StaticticsCard({
    super.key,
    this.backgroundColor,
    this.iconPath = '',
    this.title = '',
    this.bodyText = '',
    this.isBodyIconVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 200,
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 10,
            children: [
              Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconOrSvg(
                  iconPath: iconPath,
                  iconColor: theme.colorScheme.primary,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  BodyTextSmall(
                    text: title,
                    color: theme.colorScheme.onSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  BodyTextBig(
                    text: bodyText,
                    color: theme.colorScheme.onSecondary,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          if (isBodyIconVisible)
            BoxOfBars(),
        ],
      ),
    );
  }
}
