import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppConnectionState {
  final bool isOnline;
  final bool? lastOnlineStatus;

  AppConnectionState({required this.isOnline, this.lastOnlineStatus});
}

class ConnectionStateCubit extends Cubit<AppConnectionState> {
  ConnectionStateCubit() : super(AppConnectionState(isOnline: true, lastOnlineStatus: null)) {
    streamSubscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      final isOnline =
          result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi);
      emit(AppConnectionState(isOnline: isOnline, lastOnlineStatus: state.isOnline));
    });
  }

  late final StreamSubscription<List<ConnectivityResult>> streamSubscription;

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
