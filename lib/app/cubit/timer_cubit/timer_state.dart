abstract class TimerState {}

class TimerEmptyState extends TimerState {}

class TimerLoadingState extends TimerState {}

class TimerLoadedState extends TimerState {
  List<dynamic> timers;
  TimerLoadedState({required this.timers});
}

class UserErrorState extends TimerState {}
