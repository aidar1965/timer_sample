import 'package:flutter/material.dart';
import 'package:timer_sample/app/cubit/timer_cubit/timers_cubit.dart';
import 'package:timer_sample/app/themes/theme_constants.dart';
import 'package:timer_sample/app/widgets/custom_button.dart';

class NewTimerView extends StatelessWidget {
  final TimersCubit timersCubit;
  const NewTimerView({Key? key, required this.timersCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData mode = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(appBarHight),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'NEW TIMER',
              style: scaffoldAppBarTextStyle,
            ),
            centerTitle: true,
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                onPressed: () {
                  timersCubit.addTimer();
                  Navigator.pop(context);
                },
                child: const Text(
                  'START RANDOM TIMER',
                  style: TextStyle(fontSize: customButtonTextHeight),
                ),
                mode: mode,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
