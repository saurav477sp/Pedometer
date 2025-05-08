import 'package:flutter/material.dart';
import 'package:pedometer/widgets/buttons/button_varients.dart';
import 'package:pedometer/widgets/buttons/utils.dart';
import 'package:pedometer/widgets/circle_loading.dart';
import 'package:pedometer/widgets/custom_svg.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';
import 'package:pedometer/widgets/text/text_style.dart';

class AppButton extends StatelessWidget {
  final double height;
  final BorderRadius? borderRadius;
  final ButtonTypeVarient buttonType;
  final ButtonColorVarients buttonColorVarients;
  final Color? fillColor;
  final bool desabled;
  final Color? desableColor;
  final Color? borderColor;
  final double borderWidth;
  final Alignment? childAlignment;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;
  final VoidCallback onClick;
  final Color? textColor;
  final IconData? prefixIcon;
  final String prefixSvgIconPath;
  final IconData? suffixIcon;
  final String suffixSvgIconPath;
  final String btnText;
  final double fontSize;
  final FontWeight fontWeight;
  final AppFontFamily fontFamily;
  final String loadingText;

  const AppButton({
    super.key,
    this.height = 58,
    this.borderRadius,
    this.buttonType = ButtonTypeVarient.fill,
    this.buttonColorVarients = ButtonColorVarients.primary,
    this.fillColor,
    this.desabled = false,
    this.desableColor,
    this.borderColor,
    this.borderWidth = 2,
    this.childAlignment,
    this.padding,
    this.isLoading = false,
    required this.onClick,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.fontSize = 16,
    this.prefixSvgIconPath = '',
    this.suffixSvgIconPath = '',
    required this.btnText,
    this.fontWeight = FontWeight.w500,
    this.fontFamily = AppFontFamily.primary,
    this.loadingText = 'In Progress...',
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(height / 2),
        color:
            buttonType == ButtonTypeVarient.fill
                ? desabled
                    ? desableColor ?? theme.disabledColor
                    : fillColor ??
                        getButtonBackgroundcolor(theme, buttonColorVarients)
                : null,
        border:
            buttonType == ButtonTypeVarient.bordered
                ? Border.all(
                  color:
                      desabled
                          ? desableColor ?? theme.disabledColor
                          : borderColor ??
                              getButtonBackgroundcolor(
                                theme,
                                buttonColorVarients,
                              ),
                  width: borderWidth,
                )
                : null,
      ),
      alignment: childAlignment ?? Alignment.center,
      padding: padding,
      child: InkWell(
        onTap: desabled || isLoading ? null : onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLoading
                ? CircleLoading(
                  height: 20,
                  width: 20,
                  color:
                      textColor ??
                      (buttonType == ButtonTypeVarient.fill
                          ? getButtonForGroundColor(theme, buttonColorVarients)
                          : getButtonBackgroundcolor(
                            theme,
                            buttonColorVarients,
                          )),
                )
                : prefixIcon != null
                ? Icon(
                  prefixIcon,
                  size: fontSize,
                  color:
                      buttonType == ButtonTypeVarient.fill
                          ? textColor ??
                              getButtonForGroundColor(
                                theme,
                                buttonColorVarients,
                              )
                          : desabled
                          ? desableColor ?? theme.disabledColor
                          : textColor ??
                              getButtonForGroundColor(
                                theme,
                                buttonColorVarients,
                              ),
                )
                : prefixSvgIconPath.isNotEmpty
                ? CustomSvg(
                  svgPath: prefixSvgIconPath,
                  height: fontSize,
                  color:
                      buttonType == ButtonTypeVarient.fill
                          ? textColor ??
                              getButtonForGroundColor(
                                theme,
                                buttonColorVarients,
                              )
                          : desabled
                          ? desableColor ?? theme.disabledColor
                          : textColor ??
                              getButtonBackgroundcolor(
                                theme,
                                buttonColorVarients,
                              ),
                )
                : SizedBox(),

            SizedBox(
              width:
                  prefixIcon != null ||
                          prefixSvgIconPath.isNotEmpty ||
                          isLoading
                      ? 10
                      : 0,
            ),

            BodyTextSmall(
              text: isLoading ? '$btnText...' : btnText,
              fontSize: 17,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              color:
                  buttonType == ButtonTypeVarient.fill
                      ? textColor ??
                          getButtonForGroundColor(theme, buttonColorVarients)
                      : desabled
                      ? desableColor ?? theme.disabledColor
                      : textColor ??
                          getButtonBackgroundcolor(theme, buttonColorVarients),
            ),

            SizedBox(
              width:
                  suffixIcon != null ||
                          suffixSvgIconPath.isNotEmpty ||
                          isLoading
                      ? 10
                      : 0,
            ),

            suffixIcon != null
                ? Icon(
                  suffixIcon,
                  size: fontSize,
                  color:
                      buttonType == ButtonTypeVarient.fill
                          ? textColor ??
                              getButtonForGroundColor(
                                theme,
                                buttonColorVarients,
                              )
                          : desabled
                          ? desableColor ?? theme.disabledColor
                          : textColor ??
                              getButtonForGroundColor(
                                theme,
                                buttonColorVarients,
                              ),
                )
                : suffixSvgIconPath.isNotEmpty
                ? CustomSvg(
                  svgPath: suffixSvgIconPath,
                  height: fontSize,
                  color:
                      buttonType == ButtonTypeVarient.fill
                          ? textColor ??
                              getButtonForGroundColor(
                                theme,
                                buttonColorVarients,
                              )
                          : desabled
                          ? desableColor ?? theme.disabledColor
                          : textColor ??
                              getButtonBackgroundcolor(
                                theme,
                                buttonColorVarients,
                              ),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
