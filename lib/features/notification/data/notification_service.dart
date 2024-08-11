import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// NotificationService handles the setup and display of local notifications.
class NotificationService {
  // Instance of FlutterLocalNotificationsPlugin to manage notifications
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initializes the notification service and sets up periodic notifications.
  Future<void> initNotification() async {
    // Configure Android initialization settings
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    // Configure iOS initialization settings
    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    // Create platform-specific initialization settings
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    // Initialize the plugin with the initialization settings
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});

    // Set up a periodic timer to show notifications every 2 hours
    Timer.periodic(const Duration(hours: 2), (Timer timer) {
      showNotification();
    });
  }

  /// Configures the details for how the notification should appear
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  /// Displays a notification with the given details
  ///
  /// If no specific details are provided, it shows a default reminder
  /// to record transactions.
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    return notificationsPlugin.show(
        id,
        title ?? 'Record Transaction',
        body ?? 'Record your expenses and keep a track of it',
        notificationDetails());
  }
}
