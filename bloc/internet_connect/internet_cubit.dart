import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity? connectivity;
  StreamSubscription? connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  void monitorInternetConnection() async {
    connectivityStreamSubscription =
        connectivity!.onConnectivityChanged.listen((connectivityResult) async {
      try {
        final result = await InternetAddress.lookup("google.com");
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          if (connectivityResult == ConnectivityResult.wifi) {
            emitInternetConnected(ConnectionType.wifi);
          } else if (connectivityResult == ConnectivityResult.mobile) {
            emitInternetConnected(ConnectionType.mobile);
          } else if (connectivityResult == ConnectivityResult.none) {
            emitInternetDisconnected();
          }
        }
      } on SocketException catch (_) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() async {
    connectivityStreamSubscription!.cancel();
    return super.close();
  }
}
