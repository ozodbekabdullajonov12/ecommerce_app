import 'package:bloc/bloc.dart';
import 'package:store/data/repositories/notification_repository.dart';
import 'package:store/features/notification/presentation/manager/notification_state.dart';
part   'notification_event.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final NotificationRepository _repo;

  NotificationBloc({required NotificationRepository repo})
      : _repo = repo,
        super(NotificationState.initial()) {
    on<NotificationLoading>(_loading);
    add(NotificationLoading());
  }

  Future<void> _loading(NotificationLoading event, Emitter emit) async {
    emit(state.copyWith(status: NotificationStatus.loading));
    final notifications = await _repo.fetchNotification();
    emit(NotificationState(notifications: notifications, status: NotificationStatus.idle));
  }
}
