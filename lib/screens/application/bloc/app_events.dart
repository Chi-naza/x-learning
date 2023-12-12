abstract class AppEvents {
  const AppEvents();
}

class TriggerAppEvent extends AppEvents {
  final int index;
  TriggerAppEvent(this.index) : super();
}
