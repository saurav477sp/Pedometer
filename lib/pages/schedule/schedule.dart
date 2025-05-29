import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pedometer/pages/schedule/controller/schedule_controller.dart';
import 'package:pedometer/widgets/text/body_text_small.dart';
import 'package:pedometer/widgets/text/heading_text_big.dart';
import 'package:table_calendar/table_calendar.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  ScheduleController scheduleController = Get.put(ScheduleController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyTextSmall(text: 'TODAY IS'),
                  HeadingTextBig(text: scheduleController.date.value),
                  TableCalendar(
                    focusedDay: scheduleController.currentDate,
                    firstDay: DateTime(2020),
                    lastDay: DateTime(2030),
                    currentDay: scheduleController.currentDate,
                    onDaySelected: (selectedDay, focusedDay) {
                      selectedDay = selectedDay;
                      focusedDay = focusedDay;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
