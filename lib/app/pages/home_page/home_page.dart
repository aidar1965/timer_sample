import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_sample/app/cubit/theme_cubit/theme_cubit.dart';
import 'package:timer_sample/app/cubit/timer_cubit/timer_state.dart';
import 'package:timer_sample/app/cubit/timer_cubit/timers_cubit.dart';
import 'package:timer_sample/app/themes/theme_constants.dart';
import 'package:timer_sample/app/pages/home_page/widgets/timers_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timerCubit = TimersCubit();
    return SafeArea(
      child: BlocProvider(
        create: (_) => timerCubit,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(appBarHight),
            child: AppBar(
              title: const Text(
                'TIMERS LIST',
                style: scaffoldAppBarTextStyle,
              ),
              centerTitle: true,
              actions: [
                BlocBuilder<ThemeCubit, ThemeData>(
                  builder: (context, state) => Switch(
                      activeColor: primaryLight,
                      value: state.brightness == Brightness.dark ? true : false,
                      onChanged: (value) =>
                          context.read<ThemeCubit>().toggleTheme()),
                )
              ],
            ),
          ),
          body: BlocBuilder<TimersCubit, TimerState>(builder: (context, state) {
            if (state is TimerEmptyState) {
              return const SizedBox();
            } else if (state is TimerLoadedState) {
              return timerListView(state, timerCubit);
            } else {
              return const SizedBox();
            }
          }),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: totalTimersTextPadding,
                child: BlocBuilder<TimersCubit, TimerState>(
                    builder: (context, state) => Text(
                          state is TimerLoadedState
                              ? 'TOTAL: ${state.timers.length.toString()}'
                              : 'TOTAL: 0',
                          style: totalTextStyle,
                        )),
              ),
              FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/new_timer',
                      arguments: timerCubit);
                },
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
