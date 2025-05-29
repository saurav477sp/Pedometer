import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleController extends GetxController {
  final currentDate = DateTime.now();
  RxString date = DateFormat('d, MMMM y').format(DateTime.now()).obs;
}
