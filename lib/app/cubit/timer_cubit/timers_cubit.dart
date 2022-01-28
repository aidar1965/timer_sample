import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_sample/app/cubit/timer_cubit/timer_state.dart';
import 'package:timer_sample/app/models/app_timer.dart';

class TimersCubit extends Cubit<TimerState> {
  TimersCubit() : super(TimerEmptyState());

  int lastTimer = 0;
  List<AppTimer> appTimerList = [];

  Future<void> addTimer() async {
    final String name;
    name = 'Timer $lastTimer';
    lastTimer++;
    final timer = AppTimer(name: name, isActive: false);
    appTimerList.add(timer);
    resumeTimer(timer);
  }

  Future<void> resumeTimer(AppTimer timer) async {
    if (countActiveTimers(appTimerList) < 4) {
      timer.isActive = true;
      final random = Random();
      int randomNumber = random.nextInt(10);
      randomNumber = randomNumber + 10;
      for (int i = randomNumber; i >= 0; i--) {
        await Future.delayed(const Duration(seconds: 1));
        timer.currentCount = i;
        if (i == 0) appTimerList.remove(timer);
        emit(TimerLoadedState(timers: appTimerList));
      }
    }
  }

  int countActiveTimers(List<AppTimer> timers) {
    int count = 0;
    timers.forEach((timer) {
      if (timer.isActive == true) count++;
    });
    return count;
  }
}
