import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());

      // Simulate authentication
      await Future.delayed(const Duration(seconds: 2));

      if (event.username != '' && event.password == 'pass') {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Invalid credentials'));
      }
    });

    on<LoginNavigateToRegister>((event, emit) {
      emit(NavigateToRegister());
    });
  }
}
