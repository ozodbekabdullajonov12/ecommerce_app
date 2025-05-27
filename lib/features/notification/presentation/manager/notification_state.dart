import 'package:equatable/equatable.dart';
import 'package:store/data/models/notification_model.dart';

enum NotificationStatus { idle, loading, error }

class NotificationState extends Equatable {
  final List<NotificationModel>? notifications;
  final NotificationStatus status;

  const NotificationState({required this.notifications, required this.status});

  @override
  List<Object?> get props => [notifications, status];

  factory NotificationState.initial() {
    return NotificationState(status: NotificationStatus.loading, notifications: []);
  }

  NotificationState copyWith({List<NotificationModel>? products, NotificationStatus? status}) {
    return NotificationState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
    );
  }
}
