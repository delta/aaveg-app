import 'package:aaveg_app/utils/clan_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const desc =
    'Legends of DeltaForce: Deeraj,VS Rahul, Vivek, Ram, Sandhya, Aditya, Jith, Kumaran, Karaen, Nimish, Mario Adarsh, Subash, Ishani, Abishake, Bharath, Hrishi';
const AndroidNotificationChannel channel =
    AndroidNotificationChannel('high_importance', 'Aaveg21', 'aaveg');

final FlutterLocalNotificationsPlugin flutterLocalNotificationplugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message : ${message.messageId}');
  print(message.data);
}

class PushNotifcation {
  initialize(BuildContext context) async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await flutterLocalNotificationplugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    var intializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/aaveg21');
    var initializationSettings =
        InitializationSettings(android: intializationSettingsAndroid);

    flutterLocalNotificationplugin.initialize(initializationSettings);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        AndroidNotificationDetails notificationDetails =
            AndroidNotificationDetails(
                channel.id, channel.name, channel.description,
                importance: Importance.max,
                priority: Priority.high,
                groupKey: channel.groupId);
        NotificationDetails notificationDetailsPlatformSpefics =
            NotificationDetails(android: notificationDetails);
        flutterLocalNotificationplugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            notificationDetailsPlatformSpefics);
      }

      List<ActiveNotification>? activeNotifications =
          await flutterLocalNotificationplugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.getActiveNotifications();
      if (activeNotifications!.isNotEmpty) {
        List<String> lines =
            activeNotifications.map((e) => e.title.toString()).toList();
        InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
            lines,
            contentTitle: '${activeNotifications.length - 1} messages',
            summaryText: '${activeNotifications.length - 1} messages');
        AndroidNotificationDetails groupNotificationDetails =
            AndroidNotificationDetails(
                channel.id, channel.name, channel.description,
                styleInformation: inboxStyleInformation,
                setAsGroupSummary: true,
                groupKey: channel.groupId);

        NotificationDetails groupNotificationDetailsPlatformSpefics =
            NotificationDetails(android: groupNotificationDetails);
        await flutterLocalNotificationplugin.show(
            0, '', '', groupNotificationDetailsPlatformSpefics);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data['open_url'] != null) {
        Utils().launchURL(message.data['open_url'], context);
      }
    });
  }

  Future<String?> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print(token);
    return token;
  }

  subscribeToTopic(String topic) async {
    await FirebaseMessaging.instance.subscribeToTopic(topic);
  }
}
