import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/screens/welcome/bloc/welcome_events.dart';
import 'package:xlearning/screens/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    print("Welcome BLOC Added!");
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState(page: state.page));
    });
  }
}
