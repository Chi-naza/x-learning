import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/screens/signIn/bloc/signin_event.dart';
import 'package:xlearning/screens/signIn/bloc/signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    print("SignIn BLOC Added!");
    // email event
    on<EmailEvent>(_emailHandler);

    // password event
    on<PasswordEvent>(_pswdHandler);
  }

  // separating the handler class for email
  void _emailHandler(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
    print("My Email is: ${event.email}");
  }

  // separating the handler class for email
  void _pswdHandler(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
    print("My Password is: ${event.password}");
  }
}
