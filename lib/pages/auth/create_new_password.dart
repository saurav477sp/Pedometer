import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/constants.dart';
import 'package:pedometer/controller/auth/new_password_controller.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/app_button.dart';
import 'package:pedometer/widgets/input/app_input.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';
import 'package:pedometer/widgets/text/heading_text_small.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  late NewPasswordController newPasswordController;

  @override
  void initState() {
    super.initState();
    newPasswordController = Get.put(NewPasswordController(), permanent: false);
    newPasswordController.getPassedData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.05,
          80,
          size.width * 0.05,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackIcon(),
            const SizedBox(height: 30),
            const HeadingTextSmall(text: 'Create new Password'),
            const SizedBox(height: 15),
            const BodyTextSmall(
              text:
                  'Yout new password must be unique from the previously used.',
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.left,
              fontSize: 16,
            ),
            const SizedBox(height: 15),
            Form(
              key: newPasswordController.newPassKey,
              child: Column(
                children: [
                  Obx(
                    () => AppInput(
                      textEditingController:
                          newPasswordController.passwordController,
                      hintText: 'password',
                      obscureText: newPasswordController.isPassObsecure.value,
                      suffixIcon: IconButton(
                        onPressed:
                            () =>
                                newPasswordController.isPassObsecure.value =
                                    !newPasswordController.isPassObsecure.value,
                        icon:
                            newPasswordController.isPassObsecure.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                      ),
                      validator: passwordValidator.call,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => AppInput(
                      textEditingController:
                          newPasswordController.conformPasswordController,
                      hintText: 'Conform Password',
                      obscureText:
                          newPasswordController.isConformPassObsecure.value,
                      suffixIcon: IconButton(
                        onPressed:
                            () =>
                                newPasswordController
                                    .isConformPassObsecure
                                    .value = !newPasswordController
                                        .isConformPassObsecure
                                        .value,
                        icon:
                            newPasswordController.isConformPassObsecure.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                      ),
                      validator: (value) {
                        if (value !=
                            newPasswordController.passwordController.text) {
                          return 'conform password must same as password';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            AppButton(
              btnText: 'Change Password',
              loadingText: 'Password Changing...',
              isLoading: newPasswordController.isSubmitting.value,
              onClick: newPasswordController.onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
