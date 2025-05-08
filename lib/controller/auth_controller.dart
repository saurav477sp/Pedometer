import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pedometer/config/routes/app_route.dart';
import 'package:pedometer/helper/local_storage_helper.dart';

class AuthController extends GetxController {
  var isLogin = false.obs;

  checkAuth({VoidCallback? cb}) async {
    var uid = await LocalStorageHelper.getItem('uid');
    log(uid.toString());
    if (uid != null && uid.isNotEmpty) {
      if (cb != null) {
        cb();
      }
      isLogin.value = true;
      Get.offNamed(AppRoute.home);
    } else {
      Get.offNamed(AppRoute.getStarted);
    }
  }
}
