import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_state.dart';
part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<NavigateToLoginEvent>((event, emit) {
      emit(NavigateToLoginState());
    });
  }
}
