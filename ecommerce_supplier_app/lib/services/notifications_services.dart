import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsServices {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // titlen
    importance: Importance.max,
  );

  static Future<void> createNotificationChanelAndInitialize() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    InitializationSettings initializationSettings =
        const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'));

    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static displayNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification!;

    flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
          ),
        ));
  }
}
