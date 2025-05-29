import 'package:store/core/client.dart';
import 'package:store/data/models/notification_model.dart';

class NotificationRepository {
  List<NotificationModel> notifications = [];
  final ApiClient client;

  NotificationRepository({required this.client});

  Future<List<NotificationModel>> fetchNotification() async{
    var notification = await client.fetchNotifications();
    notifications = notification.map((e) => NotificationModel.fromJson(e)).toList();
    return notifications;
  }
}
