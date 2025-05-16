import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedometer/widgets/text/sub_heading_text.dart';
import 'package:pedometer/widgets/text/text_style.dart';

enum AppInputBorderType { none, underline, all }

class AppInput extends StatelessWidget {
  final double? width;
  final double? height;
  final String? label;
  final bool obscureText;
  final String? hintText;
  final TextInputAction? textInputAction;
  final Function(String? value)? onSubmit;
  final TextEditingController textEditingController;
  final Function(String? value)? onchange;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool? enable;
  final bool readOnly;
  final AppInputBorderType borderType;
  final int? maxLength;
  final int? maxLines;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Color? prefixColor;
  final Color? suffixColor;
  final Color? fillColor;
  final FocusNode? focusNode;
  final Color? borderColor;
  final String? errorText;
  final Color? errorColorCode;
  final BorderRadius? borderRadius;
  final Color? cursorcolor;
  final Color? borderFocusColor;
  final TextAlign textAlign;
  final List<TextInputFormatter>? textInputFormatter;
  final Function()? onTap;
  final Function()? onEditinComplete;
  const AppInput({
    super.key,
    this.width,
    this.height,
    this.label,
    this.obscureText = false,
    this.hintText,
    this.textInputAction,
    this.onSubmit,
    required this.textEditingController,
    this.onchange,
    this.validator,
    this.textInputType,
    this.enable,
    this.readOnly = false,
    this.borderType = AppInputBorderType.all,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.maxLines,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.suffixColor,
    this.prefixColor,
    this.fillColor,
    this.focusNode,
    this.borderColor,
    this.errorText,
    this.errorColorCode,
    this.borderRadius,
    this.cursorcolor,
    this.borderFocusColor,
    this.textInputFormatter,
    this.onTap,
    this.onEditinComplete,
  });

  InputBorder getBorder(
    ThemeData theme, {
    bool isError = false,
    Color? focusColor,
  }) {
    return borderType == AppInputBorderType.none
        ? InputBorder.none
        : borderType == AppInputBorderType.underline
        ? UnderlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(40),
          borderSide: BorderSide(
            color:
                isError
                    ? errorColorCode ?? theme.colorScheme.error
                    : borderColor ?? theme.colorScheme.onPrimary,
            width: 1,
            style: BorderStyle.solid,
          ),
        )
        : OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(40),
          borderSide: BorderSide(
            color:
                isError
                    ? errorColorCode ?? theme.colorScheme.error
                    : focusColor ?? borderColor ?? Colors.transparent,
            width: 1,
            style: BorderStyle.solid,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: TextFormField(
        textInputAction: textInputAction,
        onFieldSubmitted: onSubmit,
        focusNode: focusNode,
        maxLength: maxLength,
        textAlign: textAlign,
        maxLines: maxLines ?? 1,
        keyboardType: textInputType,
        enabled: enable,
        readOnly: readOnly,
        controller: textEditingController,
        validator: validator,
        inputFormatters: textInputFormatter,
        obscureText: obscureText,
        onChanged: onchange,
        onTap: onTap,
        onEditingComplete: onEditinComplete,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: theme.colorScheme.onPrimary.withOpacity(0.5),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: AppFontFamily.primary.toValues(),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          border: getBorder(theme),
          enabledBorder: getBorder(theme),
          focusedBorder: getBorder(
            theme,
            focusColor: borderFocusColor ?? theme.colorScheme.onPrimary,
          ),
          errorBorder: getBorder(theme, isError: true),
          fillColor: fillColor ?? theme.colorScheme.tertiary,
          error:
              errorText != null
                  ? SubHeadingText(
                    text: errorText!,
                    color: errorColorCode ?? theme.colorScheme.error,
                  )
                  : null,
          errorMaxLines: 1,
          filled: true,
          prefix: prefix,
          prefixIcon: prefixIcon,
          suffix: suffix,
          suffixIcon: suffixIcon,
          prefixIconColor: prefixColor ?? theme.colorScheme.onPrimary,
          suffixIconColor: suffixColor ?? theme.colorScheme.onPrimary,
        ),
        style: TextStyle(color: theme.colorScheme.onPrimary),
        cursorColor: cursorcolor ?? theme.colorScheme.onPrimary,
      ),
    );
  }
}
