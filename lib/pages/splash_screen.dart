import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/controller/auth_controller.dart';
import 'package:pedometer/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.find<AuthController>();
  @override
  void initState() {
    super.initState();
    authController.checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Logo()));
  }
}
