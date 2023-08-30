import 'dart:async';

import 'package:first_bloc_app/bloc/login_event.dart';
import 'package:first_bloc_app/bloc/login_state.dart';

class LoginBloc {
  final _statecontroller = StreamController<LoginState>();
  Stream<LoginState> get state => _statecontroller.stream;

  void send(LoginEvent event) {
    switch (event) {
      case LoginEvent.login:
        _statecontroller.sink.add(LoginState.loading());
        Future.delayed(const Duration(seconds: 2), () {
          _statecontroller.sink.add(LoginState.success());
        });
    }
  }

  void dispose() {
    _statecontroller.close();
  }
}
