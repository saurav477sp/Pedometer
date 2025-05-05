import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pages/create_new_password.dart';
import 'package:pedometer/services/messenging/otp_mail.dart';
import 'package:pedometer/services/otp_generator.dart';
import 'package:pedometer/widgets/back_icon.dart';
import 'package:pedometer/widgets/buttons/submit_button.dart';
import 'package:pedometer/widgets/input/otp_inputfield.dart';
import 'package:pedometer/widgets/text/body_big.dart';
import 'package:pedometer/widgets/text/body_small.dart';
import 'package:pedometer/widgets/textButton/custom_text_button.dart';

class OtpVarification extends StatefulWidget {
  final String otp;
  final String email;
  const OtpVarification({super.key, required this.otp, required this.email});

  @override
  State<OtpVarification> createState() => _OtpVarificationState();
}

class _OtpVarificationState extends State<OtpVarification> {
  late String email;
  List<TextEditingController> textEditingController =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusnode = List.generate(4, (index) => FocusNode());

  Size size = Get.size;
  late String currentOTP;

  @override
  void initState() {
    super.initState();
    currentOTP = widget.otp;
    email = widget.email;
  }

  void verifyOTP() {
    String otp = textEditingController.map((e) => e.text).join();
    currentOTP == otp
        ? {
            Get.snackbar('success', 'otp varified'),
            Get.to(() => CreateNewPassword(email: email,))
          }
        : Get.snackbar('fail', 'fail to varify');
  }

  void resendOTP() async{
    String newOTP = OtpGenerator().generateOTP();
    bool isotpSent = await OtpMail().sendOTP(email, newOTP);
    Get.snackbar('otp', newOTP);
    if (newOTP.isNotEmpty && isotpSent) {
      setState(() {
        currentOTP = newOTP;
        for (var controller in textEditingController) {
          controller.clear();
        }
        FocusScope.of(context).requestFocus(focusnode[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(size.width * 0.08, 80, size.width * 0.08, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackIcon(),
            const SizedBox(
              height: 45,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BodyBig(text: 'OTP Varification'),
                    const SizedBox(height: 15,),
                    const BodySmall(
                      text:
                          'Enter the varification code we just sent to your email address.',
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(height: 15,),
                    OtpInputfield(
                      textEditingController: textEditingController,
                      focusnode: focusnode,
                    ),
                    const SizedBox(height: 20,),
                    SubmitButton(
                      text: 'Varify',
                      color: Colors.white,
                      fontColor: Colors.black,
                      onClick: () => verifyOTP(),
                    ),
                  ],
                ),
              ),
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextButton(
                  text: 'Did\'n received code? ',
                  fontWeight: FontWeight.w500,
                ),
                CustomTextButton(
                  text: 'Resend',
                  fontColor: Colors.yellow,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  onPressed: () => resendOTP(),
                )
              ],
            )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
