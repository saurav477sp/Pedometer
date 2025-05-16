import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/initial_bindings.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/config/theme/custom_theme.dart';
import 'package:pedometer/controller/theme_controller.dart';

class AppSettings extends StatefulWidget {
  const AppSettings({super.key});

  @override
  State<AppSettings> createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pedometer',
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.system,
      // themeMode: themeController.themeMode.value,
      getPages: AppRouteConfig.routes,
      initialRoute: AppRoute.splash,
      initialBinding: InitialBindings(),
      unknownRoute: AppRouteConfig.notFoundPage,

      // home: StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Scaffold(body: Center(child: Logo()));
      //     }
      //     if (snapshot.hasData) {
      //       return StreamBuilder(
      //         stream: FirebaseAuth.instance.idTokenChanges(),
      //         builder: (context, snapshot) {
      //           log(snapshot.toString());
      //           if (snapshot.connectionState == ConnectionState.waiting) {
      //             return const Center(child: Logo());
      //           }
      //           if (snapshot.hasData && snapshot.data != null) {
      //             return const Home();
      //           }
      //           return const SplashScreen();
      //         },
      //       );
      //     }
      //     return const SplashScreen();
      //   },
      // ),
    );
  }
}
