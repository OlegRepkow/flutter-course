import 'package:flutter/material.dart';
import 'package:flutter_lab/features/push_notifications/local_push_notif_service.dart';

class PushNotificationsScreen extends StatelessWidget {
  const PushNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notifications'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton.icon(
                onPressed: () =>
                    LocalPushNotifService.instance.showNotification(
                      id: 1,
                      title: 'Instant Notification',
                      body: 'This notification was shown immediately!',
                    ),
                icon: const Icon(Icons.notifications_active),
                label: const Text(
                  'Відправити нотифікацію',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () =>
                    LocalPushNotifService.instance.showScheduledNotification(
                      id: 2,
                      title: 'Scheduled Notification',
                      body: 'This notification was scheduled 5 seconds ago!',
                      delay: const Duration(seconds: 5),
                    ),
                icon: const Icon(Icons.schedule),
                label: const Text(
                  'Відправити відкладену нотифікацію',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
