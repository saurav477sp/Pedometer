import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:pedometer/widgets/custom_snackbar.dart';

class OtpMail {
  List<String> attachments = [];

  Future<bool> sendOTP(String email , String otp) async {
    final smtpServer =
        gmail(dotenv.get('GMAIL_EMAIL'), dotenv.get('GMAIL_PASSWORD'));
    final message = Message()
      ..from = Address(dotenv.get('GMAIL_EMAIL'), 'saurav')
      ..recipients = [email]
      ..subject = 'OTP for pedometer'
      ..text = 'Your OTP is $otp';

    try {
      await send(message, smtpServer);
      return true;
    } on MailerException catch (e) {
      CustomSnackbar.showSnackbar('error', e.message);
      log(e.message.toString());
      return false;
    }
  }
}
