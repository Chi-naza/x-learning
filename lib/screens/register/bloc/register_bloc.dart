import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/screens/register/bloc/register_events.dart';
import 'package:xlearning/screens/register/bloc/register_states.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<EmailEvent>(_emailEventHandler);
    on<UserNameEvent>(_userNameEventHandler);
    on<PasswordEvent>(_passwordEventHandler);
    on<RePasswordEvent>(_rePasswordEventHandler);

    print("Register BLOC Injected!");
  }

  // email handler
  _emailEventHandler(EmailEvent event, Emitter emit) {
    emit(state.copyWWith(email: event.email));
  }

  // username handler
  _userNameEventHandler(UserNameEvent event, Emitter emit) {
    emit(state.copyWWith(username: event.username));
  }

  // password handler
  _passwordEventHandler(PasswordEvent event, Emitter emit) {
    emit(state.copyWWith(password: event.password));
  }

  // re-password handler
  _rePasswordEventHandler(RePasswordEvent event, Emitter emit) {
    emit(state.copyWWith(rePassword: event.rePassword));
  }
}
