import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pedometer/config/app_settings.dart';
import 'package:pedometer/config/notification_config.dart';
import 'package:pedometer/config/theme/app_color.dart';
import 'package:pedometer/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on FirebaseException catch (e) {
    log('Firebase initialization exception: $e');
  }
  try {
    await NotificationConfig.initializeAwsomeNotification();
  } catch (e) {
    log('Notification initialization exception: $e');
  }

  final Brightness platformBrightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  log(platformBrightness.toString());

  SystemChrome.setSystemUIOverlayStyle(
    platformBrightness == Brightness.light
        ? SystemUiOverlayStyle.light.copyWith(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent
        )
        : SystemUiOverlayStyle.dark.copyWith(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent
        ),
  );

  runApp(const AppSettings());
}
