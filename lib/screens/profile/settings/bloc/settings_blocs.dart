import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xlearning/screens/profile/settings/bloc/settings_events.dart';
import 'package:xlearning/screens/profile/settings/bloc/settings_states.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingStates> {
  SettingsBlocs() : super(const SettingStates()) {
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingsEvents event, Emitter<SettingStates> emit) {
    emit(const SettingStates());
  }
}
