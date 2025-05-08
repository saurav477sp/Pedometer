import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/controller/login_controller.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController textEditingController;
  final double? width;
  final String hintText;
  final Color? color;
  final bool isSuffixVisible;
  const PasswordField({
    super.key,
    required this.textEditingController,
    this.width,
    this.color,
    this.hintText = 'password',
    this.isSuffixVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LoginController loginController = Get.find<LoginController>();
    return Container(
      width: width ?? size.width * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? Get.theme.colorScheme.tertiary,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Obx(
        () => TextFormField(
          controller: textEditingController,
          obscureText: loginController.obsecure.value,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            suffixIcon: IconButton(
              onPressed: () => loginController.obsecure.value = !loginController.obsecure.value,
              icon:
                  loginController.obsecure.value
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
          ),
          onChanged: (value) {
            /* show linear progress bar */
          },
          onSaved: (newValue) {
            /* check validation*/
          },
          // validator: (value) {/* check validation*/},
        ),
      ),
    );
  }
}
