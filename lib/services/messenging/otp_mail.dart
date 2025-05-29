import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:pedometer/widgets/popup/snackbar.dart';

class OtpMail {
  Future<bool> sendOTP(String email , String otp) async {
    final smtpServer =
        gmail(dotenv.get('GMAIL_EMAIL'), dotenv.get('GMAIL_PASSWORD'));
    final message = Message()
      ..from = Address(dotenv.get('GMAIL_EMAIL'), 'Pedometer')
      ..recipients = [email]
      ..subject = 'OTP for pedometer'
      ..text = 'Your OTP is $otp for varification';

    try {
      await send(message, smtpServer);
      return true;
    } on MailerException catch (e) {
      CustomSnackbar.showSnackbar('error', e.message);
      log(' otp sending on mail problem ======> ${e.message.toString()}');
      return false;
    }
  }
}
