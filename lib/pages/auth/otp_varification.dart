import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pedometer/controller/auth/otp_varification_controller.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/app_button.dart';
import 'package:pedometer/widgets/input/app_input.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';
import 'package:pedometer/widgets/text/heading_text_small.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class OtpVarification extends StatefulWidget {
  const OtpVarification({super.key});

  @override
  State<OtpVarification> createState() => _OtpVarificationState();
}

class _OtpVarificationState extends State<OtpVarification> {
  late OtpVarificationController otpVarificationController;

  @override
  void initState() {
    super.initState();
    otpVarificationController = Get.put(OtpVarificationController());
    otpVarificationController.getPassedData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          size.width * 0.05,
          80,
          size.width * 0.05,
          30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 45,
          children: [
            const BackIcon(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  const HeadingTextSmall(text: 'OTP Varification'),
                  const BodyTextSmall(
                    text:
                        'Enter the varification code we just sent to your email address.',
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      otpVarificationController.otpController.length,
                      (index) => AppInput(
                        textEditingController:
                            otpVarificationController.otpController[index],
                        focusNode:
                            otpVarificationController.otpFocusNode[index],
                        textInputType: TextInputType.number,
                        height: 88,
                        width: 58,

                        borderRadius: BorderRadius.circular(10),
                        textAlign: TextAlign.center,
                        textInputFormatter: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onchange: (value) {
                          if (value != null) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(context).requestFocus(
                                otpVarificationController.otpFocusNode[index +
                                    1],
                              );
                            } else if (value.isEmpty && index >= 1) {
                              FocusScope.of(context).requestFocus(
                                otpVarificationController.otpFocusNode[index -
                                    1],
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ),

                  Obx(
                    () => AppButton(
                      btnText: 'Varify',
                      isLoading: otpVarificationController.isVarifying.value,
                      onClick: () => otpVarificationController.varifyOtp(),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 2,
              children: [
                Obx(
                  () => CustomTextButton(
                    text:
                        otpVarificationController.isOtpResend.value
                            ? 'Did\'n received code? '
                            : 'Resend otp in: ',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Obx(
                  () => CustomTextButton(
                    text:
                        otpVarificationController.isOtpResend.value
                            ? 'Resend'
                            : '${otpVarificationController.timerSeconds.value}s',
                    fontColor: theme.colorScheme.secondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    onPressed:
                        otpVarificationController.isOtpResend.value
                            ? () => otpVarificationController.resendOTP()
                            : () {},
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
