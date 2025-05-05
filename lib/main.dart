import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:pedometer/firebase_options.dart';
import 'package:pedometer/pages/home.dart';
import 'package:pedometer/pages/splash_screen.dart';
import 'package:pedometer/config/theme/custom_theme.dart';
import 'package:pedometer/widgets/logo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

CustomTheme _customTheme = CustomTheme();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'pedometer',
      debugShowCheckedModeBanner: false,
      theme: _customTheme.lightTheme,
      darkTheme: _customTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(body: Center(child: Logo()));
          }
          if (snapshot.hasData) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.idTokenChanges(),
              builder: (context, snapshot) {
                log(snapshot.toString());
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Logo());
                }
                if (snapshot.hasData && snapshot.data != null) {
                  return const Home();
                }
                return const SplashScreen();
              },
            );
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
