import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meet/business_logic/connectivity_bloc/connectivity_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final InternetConnectionChecker internetConnection;
  StreamSubscription? connectionStreamSubscription;

  InternetCubit({required this.internetConnection})
      : super(InternetLoadingState()) {
    connectionStreamSubscription =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            emitInternetConnectedState();
            break;
          case InternetConnectionStatus.disconnected:
            emitInternetDisconnectedState();
            break;
        }
      },
    );
  }

  void emitInternetConnectedState() => emit(InternetConnected());
  void emitInternetDisconnectedState() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectionStreamSubscription?.cancel();
    return super.close();
  }
}
