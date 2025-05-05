import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/theme/custom_colors.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController textEditingController;
  final double? width;
  final String hintText;
  final Color color;
  final bool isSuffixVisible;
  const PasswordField(
      {super.key,
      required this.textEditingController,
      this.width,
      this.color = CustomColors.fieldColor,
      this.hintText = 'password',
      this.isSuffixVisible = false});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  Size size = Get.size;
  RxBool isObsecure = true.obs;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? size.width * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(40)),
      child: Obx(
        () => TextFormField(
          controller: widget.textEditingController,
          obscureText: isObsecure.value,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            suffixIcon: IconButton(
                onPressed: () => isObsecure.value = !isObsecure.value,
                icon: isObsecure.value
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility)),
            contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          onChanged: (value) {/* show linear progress bar */},
          onSaved: (newValue) {/* check validation*/},
          // validator: (value) {/* check validation*/},
        ),
      ),
    );
  }
}
