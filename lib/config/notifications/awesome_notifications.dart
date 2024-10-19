import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:quizer/config/routes/route_constants.dart';
import 'package:quizer/core/resources/app_colors.dart';
import 'package:quizer/main.dart';

class NotificationsModel {
  static init() async {
    await AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'daily_reminder_channel',
          channelName: 'Daily Reminder Notifications',
          channelDescription: 'Reminder notifications for daily tasks',
          defaultColor: AppColors.purpleColor,
          ledColor: AppColors.whiteColor,
          importance: NotificationImportance.High,
        ),
      ],
    );

    AwesomeNotifications().setListeners(
        onActionReceivedMethod: (receivedAction) =>
            onActionReceivedMethod(receivedAction));
  }

  static onActionReceivedMethod(ReceivedAction receivedAction) async {
    if (receivedAction.buttonKeyPressed == 'ACCEPT') {
      MyApp.navigatorKey.currentState
          ?.pushNamed(Routes.logInScreenRoute); // go to login screen
    } else if (receivedAction.buttonKeyPressed == 'CANCEL') {}
  }

  static scheduleDailyReminderNotification() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'daily_reminder_channel',
        title: 'Daily Reminder',
        body: 'Don\'t forget to check the app today!',
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: "ACCEPT",
          label: "Accept",
          color: AppColors.successColor,
          actionType: ActionType.Default,
        ),
        NotificationActionButton(
          key: "CANCEL",
          label: "Cancel",
          color: AppColors.errorColor,
          actionType: ActionType.DisabledAction,
        ),
      ],
      schedule: NotificationCalendar(
        hour: 19, // Schedule at 10 AM
        minute: 20,
        second: 0,
        repeats: true, // Make it repeat daily
      ),
    );
  }
}
