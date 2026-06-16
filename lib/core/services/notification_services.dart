import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fruit_hub_market/core/utils/app_imports.dart';

class NotificationServices {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _local =
  FlutterLocalNotificationsPlugin();

  // ================= INIT LOCAL =================
  static Future<void> initLocal() async {
    const AndroidInitializationSettings android =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings settings =
    InitializationSettings(android: android);

    await _local.initialize(settings);
  }

  // ================= SHOW NOTIFICATION =================
  static Future<void> showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails =
    AndroidNotificationDetails(
      'default_channel',
      'General Notifications',
      channelDescription: 'App notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails details =
    NotificationDetails(android: androidDetails);

    await _local.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      message.notification?.title ?? 'No Title',
      message.notification?.body ?? 'No Body',
      details,
    );
  }

  // ================= INIT FIREBASE =================
  static Future<void> initFirebase() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    final token = await _firebaseMessaging.getToken();
    print("FCM Token: $token");

    // 🔥 Foreground messages
    FirebaseMessaging.onMessage.listen((message) {
      print("📩 Foreground Message: ${message.data}");

      if (message.notification != null) {
        showNotification(message);
      }
    });

    // 🔥 Background click
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print("Opened from background");
    });

    // 🔥 Terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print("Opened from terminated");
      }
    });
  }
}