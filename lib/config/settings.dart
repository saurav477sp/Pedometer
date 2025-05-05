// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pedometer/pages/home.dart';
// import 'package:pedometer/pages/splash_screen.dart';
// import 'package:pedometer/widgets/logo.dart';

// class Settings extends StatefulWidget {
//   const Settings({super.key});

//   @override
//   State<Settings> createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'pedometer',
//       debugShowCheckedModeBanner: false,
//       theme: _customTheme.lightTheme,
//       darkTheme: _customTheme.darkTheme,
//       themeMode: ThemeMode.system,
//       home: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Scaffold(body: Center(child: Logo()));
//           }
//           if (snapshot.hasData) {
//             return StreamBuilder(
//               stream: FirebaseAuth.instance.idTokenChanges(),
//               builder: (context, snapshot) {
//                 log(snapshot.toString());
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: Logo());
//                 }
//                 if (snapshot.hasData && snapshot.data != null) {
//                   return const Home();
//                 }
//                 return const SplashScreen();
//               },
//             );
//           }
//           return const SplashScreen();
//         },
//       ),
//     );
//   }
// }
