import 'package:eliteware/features/stopwatch/usecase/stopwatch_usecase.dart';
import 'package:eliteware/features/stopwatch/viewmodel/stopwatch_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StopwatchScreen extends StatelessWidget {
  const StopwatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StopwaatchViewmodel>(
      create: (context) =>
          StopwaatchViewmodel(timerUsecase: StopwaatchUsecase()),
      child: const Stopwaatch(),
    );
  }
}

class Stopwaatch extends StatelessWidget {
  const Stopwaatch({super.key});

  @override
  Widget build(BuildContext context) {
    final tVm = context.watch<StopwaatchViewmodel>();
    return SafeArea(
        child: Column(
      children: [
        Text(
          "${tVm.hours}:${tVm.minutes}:${tVm.seconds}",
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              final tVm = context.read<StopwaatchViewmodel>();
              tVm.startTimer();
            },
            child: const Text("Start Timer")),
        ElevatedButton(
            onPressed: () {
              final tVm = context.read<StopwaatchViewmodel>();
              tVm.stopTimer();
            },
            child: const Text("Stop Timer")),
        ElevatedButton(
            onPressed: () {
              final tVm = context.read<StopwaatchViewmodel>();
              tVm.resetTimer();
            },
            child: const Text("Reset Timer"))
      ],
    ));
  }
}
