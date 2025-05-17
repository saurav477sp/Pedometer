import 'package:get/get.dart';

class GetStartedController extends GetxController {
  RxDouble textOpacity = 0.0.obs;
  RxDouble buttonOpacity = 0.0.obs;

  delay() async {
    await Future.delayed(
      const Duration(microseconds: 1500),
      () => textOpacity.value = 1.0,
    );
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () => buttonOpacity.value = 1.0,
    );
  }
}
