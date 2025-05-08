import 'package:flutter/material.dart';
import 'package:pedometer/widgets/buttons/submit_button.dart';
import 'package:pedometer/widgets/custom_check_ui.dart';
import 'package:pedometer/widgets/text/body_text_big.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';

class PasswordChangedUi extends StatelessWidget {
  const PasswordChangedUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomCheckUi(),
            const SizedBox(height: 20,),
            const BodyTextBig(text: 'Password Changed!',fontSize: 30,),
            const SizedBox(height: 5,),
            Container(alignment: Alignment.center,child: const BodyTextSmall(text: 'Your password has been changed',fontWeight: FontWeight.w300,)),
            Container(alignment: Alignment.center,child: const BodyTextSmall(text: 'successfully',fontWeight: FontWeight.w300,)),
            const SizedBox(height: 15,),
            SubmitButton(text: 'Back to Login', onClick: () {},),
          ],
        ),
      ),
    );
  }
}
