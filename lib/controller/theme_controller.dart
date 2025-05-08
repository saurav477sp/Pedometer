import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/helper/local_storage_helper.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;

  toggleTheme() {
    if (themeMode.value == ThemeMode.light) {
      changeTheme(mode: ThemeMode.dark);
    } else {
      changeTheme(mode: ThemeMode.light);
    }
  }

  changeTheme({required ThemeMode mode}) {
    themeMode.value = mode;
    try {
      switch (themeMode.value) {
        case ThemeMode.light:
          LocalStorageHelper.setItem('theme', 'light');
          break;
        case ThemeMode.dark:
          LocalStorageHelper.setItem('theme', 'dark');
          break;
        case ThemeMode.system:
          LocalStorageHelper.setItem('theme', 'system');
          break;
        default:
          LocalStorageHelper.setItem('theme', 'light');
          break;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  setDefaultTheme() async {
    try {
      var theme = await LocalStorageHelper.getItem('theme');

      switch (theme) {
        case 'light':
          changeTheme(mode: ThemeMode.light);
          break;
        case 'dark':
          changeTheme(mode: ThemeMode.dark);
          break;
        case 'system':
          changeTheme(mode: ThemeMode.system);
          break;
        default:
          changeTheme(mode: ThemeMode.light);
          break;
      }
    } catch (e) {
      log(e.toString());
      changeTheme(mode: ThemeMode.light);
    }
  }
}
