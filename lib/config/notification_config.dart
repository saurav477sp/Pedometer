import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/rendering.dart';

class NotificationConfig {
  static const String channelKey = 'Pedometer';
  static const String channelName = 'Pedometer';
  static const String channelDescription = 'pedometer notification';
  static Future<void> initializeAwsomeNotification() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/not', 
      [
      NotificationChannel(
        channelKey: channelKey,
        channelName: channelName,
        channelDescription: channelDescription,
        enableVibration: true,
        onlyAlertOnce: true,
        playSound: true,
        importance: NotificationImportance.High,
        // defaultPrivacy: NotificationPrivacy.Private,
      ),
    ], debug: true);
  }

  static Future<void> createNotification(
    String title,
    String description, {
    String? image,
    DateTime? schedule,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      isAllowed =
          await AwesomeNotifications().requestPermissionToSendNotifications();
    }
    if (!isAllowed) {
      return;
    }

    debugPrint(image);

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(1000),
        channelKey: channelKey,
        title: title,
        body: description,
        bigPicture: image,
        largeIcon: image,
        notificationLayout: NotificationLayout.BigPicture,
        roundedBigPicture: true,
        roundedLargeIcon: true,
        wakeUpScreen: true,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'reply',
          label: 'Reply',
          autoDismissible: false,
          enabled: true,
          requireInputText: true,
        ),
        NotificationActionButton(key: 'mark as read', label: 'Mark as read'),
      ],
      schedule:
          schedule == null
              ? null
              : NotificationCalendar(
                year: schedule.year,
                month: schedule.month,
                day: schedule.day,
                hour: schedule.hour,
                minute: schedule.minute,
                second: 0,
                millisecond: 0,
                repeats: false,
                preciseAlarm: true,
                timeZone:
                    await AwesomeNotifications().getLocalTimeZoneIdentifier(),
              ),
    );
  }
}
