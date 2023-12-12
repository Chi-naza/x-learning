import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/screens/application/bloc/app_events.dart';
import 'package:xlearning/screens/application/bloc/app_states.dart';

class AppBloc extends Bloc<AppEvents, AppStates> {
  AppBloc() : super(const AppStates()) {
    print("Application BLOC Injected!");

    on<TriggerAppEvent>((event, emit) {
      emit(AppStates(index: event.index));
    });
  }
}
