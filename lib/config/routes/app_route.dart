import 'package:get/get.dart';
import 'package:pedometer/pages/auth/create_new_password.dart';
import 'package:pedometer/pages/auth/forgot_password.dart';
import 'package:pedometer/pages/get_started.dart';
import 'package:pedometer/pages/home.dart';
import 'package:pedometer/pages/auth/login.dart';
import 'package:pedometer/pages/auth/otp_varification.dart';
import 'package:pedometer/pages/auth/password_changed_ui.dart';
import 'package:pedometer/pages/auth/registration.dart';
import 'package:pedometer/pages/splash_screen.dart';

class AppRoute {
  static const splash = '/splash';
  static const registration = '/registration';
  static const login = '/login';
  static const home = '/home';
  static const passwordChange = '/passwordChange';
  static const otpVarification = '/otpVarification';
  static const forgotPassword = '/forgotPassword';
  static const createNewPassword = '/createNewPassword';
  static const getStarted = '/getStarted';
  static const passChangedSucces = '/passChanged';
}

class AppRouteConfig {
  static final List<GetPage> routes = [
    GetPage(name: AppRoute.splash, page: () => SplashScreen(),),
    GetPage(name: AppRoute.registration, page: () => Registration(),),
    GetPage(name: AppRoute.login, page: () => Login(),),
    GetPage(name: AppRoute.home, page: () => Home(),),
    GetPage(name: AppRoute.otpVarification, page: () => OtpVarification(),),
    GetPage(name: AppRoute.forgotPassword, page: () => ForgotPassword(),),
    GetPage(name: AppRoute.createNewPassword, page: () => CreateNewPassword(),),
    GetPage(name: AppRoute.getStarted, page: () => GetStarted(),),
    GetPage(name: AppRoute.passChangedSucces, page: () => PasswordChangedUi(),),
  ];
  static final GetPage notFoundPage = GetPage(name: AppRoute.splash, page: () => SplashScreen(),);
}
