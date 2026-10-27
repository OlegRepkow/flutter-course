import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_lab/core/firebase/firebase_options.dart';
import 'package:flutter_lab/features/push_notifications/local_push_notif_service.dart';

final class FirebasePushNotificationService {
  FirebasePushNotificationService._();

  static final FirebasePushNotificationService instance =
      FirebasePushNotificationService._();

  late final FirebaseMessaging _firebaseMessaging;

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    _firebaseMessaging = FirebaseMessaging.instance;
    await _firebaseMessaging.requestPermission();

    //need to add token to the database
    final token = await _firebaseMessaging.getToken();
    debugPrint('Firebase token: $token');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final notification = message.notification;

      if (notification != null) {
        LocalPushNotifService.instance.showNotification(
          id: notification.hashCode,
          title: notification.title ?? '',
          body: notification.body ?? '',
        );
      }
    });
  }
}
