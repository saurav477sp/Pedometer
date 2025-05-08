// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pedometer/config/routes/app_route.dart';
// import 'package:pedometer/controller/login_controller.dart';
// import 'package:pedometer/pages/forgot_password.dart';
// import 'package:pedometer/pages/registration.dart';
// import 'package:pedometer/services/firebase/authentication.dart';
// import 'package:pedometer/services/input_varification.dart';
// import 'package:pedometer/widgets/back_icon.dart';
// import 'package:pedometer/widgets/buttons/submit_button.dart';
// import 'package:pedometer/widgets/input/custom_textfield.dart';
// import 'package:pedometer/widgets/input/password_field.dart';
// import 'package:pedometer/widgets/logo.dart';
// import 'package:pedometer/widgets/text/body_big.dart';
// import 'package:pedometer/widgets/textButton/custom_text_button.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   LoginController loginController = Get.put(LoginController());
//   // final TextEditingController _emailController = TextEditingController();
//   // final TextEditingController _passwordController = TextEditingController();
//   Size size = Get.size;
//   InputVarification inputVarification = InputVarification();
//   RxBool isSuffixVisible = false.obs;

//   void inputValidate() {
//     String email = loginController.emailController.value.text.trim();
//     String password = loginController.passwordController.value.text.trim();

//     if (email.isEmpty || password.isEmpty) {
//       Get.snackbar('Error', 'Please enter a valid email and password.');
//       return;
//     }
//     if (!inputVarification.emailVarify(email)) {
//       Get.snackbar('Error', 'Please enter a valid email.');
//       return;
//     }
//     if (!inputVarification.passwordVarify(password)) {
//       Get.snackbar('Error', 'Please enter a valid password.');
//       return;
//     }

//     Authentication().signinUser(email, password);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(size.width * 0.04, 80, size.width * 0.04, 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             BackIcon(),
//             SizedBox(height: 60,),
//             Logo(radius: 30),
//             SizedBox(height: 20),
//             BodyTextBig(
//               text: 'welcome back! Glad to see you, Again!',
//               fontSize: 27,
//             ),
//             SizedBox(height: 30),
//             CustomTextfield(
//               textEditingController: loginController.emailController.value,
//               hintText: 'enter your email',
//             ),
//             SizedBox(height: 10),
//             PasswordField(
//               textEditingController: loginController.passwordController.value,
//               hintText: 'enter your password',
//             ),
//             SizedBox(height: 10),
//             Container(
//               padding: EdgeInsets.only(right: size.width * 0.04),
//               alignment: Alignment.bottomRight,
//               child: CustomTextButton(
//                 text: 'forgot Password?',
//                 fontSize: 15,
//                 fontWeight: FontWeight.w600,
//                 onPressed: () => Get.toNamed(AppRoute.forgotPassword),
//               ),
//             ),
//             SizedBox(height: 20),
//             SubmitButton(
//               text: 'Log In',
//               onClick: () => inputValidate(),
//             ),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CustomTextButton(
//                     text: 'Don\'t have an account? ',
//                     fontWeight: FontWeight.w500,
//                     onPressed: () => Get.offAll(() => Registration()),
//                   ),
//                   CustomTextButton(
//                     text: 'Register Now',
//                     fontColor: Colors.yellow,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     onPressed: () => Get.offAll(() => Registration()),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
