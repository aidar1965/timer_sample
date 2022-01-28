import 'package:flutter/material.dart';
import 'package:timer_sample/app/cubit/timer_cubit/timer_state.dart';
import 'package:timer_sample/app/cubit/timer_cubit/timers_cubit.dart';
import 'package:timer_sample/app/models/app_timer.dart';
import 'package:timer_sample/app/themes/theme_constants.dart';

Widget timerListView(TimerLoadedState state, TimersCubit timerCubit) {
  return ListView.builder(
      itemCount: state.timers.length,
      itemBuilder: (context, index) {
        var item = state.timers[index];
        bool status = item.isActive;
        return Column(
          children: [
            ListTile(
              title: Text(
                item.name,
                style: listTileTextStyle,
              ),
              trailing: status
                  ? item.currentCount != null
                      ? Text(item.currentCount.toString())
                      : const SizedBox()
                  : InkWell(
                      onTap: () {
                        timerCubit.resumeTimer(item as AppTimer);
                      },
                      child: const Text(
                        'paused',
                        style: buttonPausedTextStyle,
                      ),
                    ),
            ),
            index != state.timers.length - 1
                ? const Padding(padding: listTilePadding, child: Divider())
                : const SizedBox(),
          ],
        );
      });
}
