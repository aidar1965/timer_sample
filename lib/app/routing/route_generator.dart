import 'package:flutter/material.dart';
import 'package:timer_sample/app/cubit/timer_cubit/timers_cubit.dart';
import 'package:timer_sample/app/pages/home_page/home_page.dart';
import 'package:timer_sample/app/pages/new_timer_page/new_timer_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/new_timer':
        return MaterialPageRoute(
          builder: (_) => NewTimerView(
            timersCubit: args as TimersCubit,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const HomeView());
    }
  }
}
