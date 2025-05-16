import 'package:flutter/material.dart';
import 'package:pedometer/widgets/buttons/app_button.dart';
import 'package:pedometer/widgets/buttons/button_varients.dart';
import 'package:pedometer/widgets/text/body_text_big.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';

class Warningpopup extends StatelessWidget {
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRaius;
  final Widget? icon;
  final String title;
  final String? description;
  final Color? borderColor;
  final double? borderWidth;
  final String cancelBtnLatel;
  final String proceedBtnLatel;
  final bool hidecCancelBtn;
  final bool hidePrimarybtn;
  final VoidCallback? onProceed;
  final Future<void> Function()? onAsyncProcede;
  const Warningpopup({
    super.key,
    this.backgroundColor,
    this.borderRaius,
    this.icon,
    required this.title,
    this.description,
    this.borderColor,
    this.borderWidth,
    this.hidecCancelBtn = false,
    this.hidePrimarybtn = false,
    this.cancelBtnLatel = 'Cancel',
    this.proceedBtnLatel = 'Proceed',
    this.onProceed,
    this.onAsyncProcede,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      backgroundColor: backgroundColor ?? theme.colorScheme.primaryContainer,
      surfaceTintColor: backgroundColor ?? theme.colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: borderRaius ?? BorderRadius.circular(15),
        side: BorderSide(
          color: borderColor ?? theme.colorScheme.surface,
          width: borderWidth ?? 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                icon != null
                    ? Container(margin: EdgeInsets.only(right: 5), child: icon)
                    : const SizedBox(),
                BodyTextBig(
                  text: title,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.left,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ],
            ),

            description != null && title.isNotEmpty
                ? Divider(color: theme.colorScheme.onPrimaryContainer)
                : const SizedBox(),

            description != null
                ? Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: BodyTextSmall(
                    text: description!,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                )
                : const SizedBox(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Spacer(flex: hidecCancelBtn || hidePrimarybtn ? 8 : 4),
                hidecCancelBtn
                    ? const SizedBox()
                    : Expanded(
                      flex: 4,
                      child: AppButton(
                        height: 40,
                        fontSize: 14,
                        textColor: theme.colorScheme.onPrimaryContainer,
                        btnText: cancelBtnLatel,
                        buttonType: ButtonTypeVarient.text,
                        onClick: () => Navigator.pop(context),
                      ),
                    ),
                hidePrimarybtn
                    ? const SizedBox()
                    : Expanded(
                      flex: 4,
                      child: AppButton(
                        height: 40,
                        fontSize: 14,
                        fillColor: const Color(0xFF559df0),
                        textColor: theme.colorScheme.primaryContainer,
                        btnText: proceedBtnLatel,
                        onClick: () {
                          if (onProceed != null) {
                            onProceed!();
                          }
                          if (onAsyncProcede != null) {
                            onAsyncProcede!();
                          }
                          Navigator.pop(context);
                        },
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
