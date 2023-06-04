import 'package:eliteware/features/timer/usecase/timer_usecase.dart';
import 'package:eliteware/features/timer/viewmodel/timer_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerViewmodel>(
      create: (context) => TimerViewmodel(stopwatchUsecase: TimerUsecase()),
      child: const Timerr(),
    );
  }
}

class Timerr extends StatelessWidget {
  const Timerr({super.key});

  @override
  Widget build(BuildContext context) {
    final tVm = context.watch<TimerViewmodel>();
    return SafeArea(
        minimum: const EdgeInsets.only(left: 24, right: 24),
        child: Form(
          key: tVm.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 40,
              ),
              if (!tVm.showStopwatch) ...[
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  validator: (val) =>
                      (val == "" ? 'This field is required' : null),
                  controller: tVm.controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Minutes',
                    hintText: 'Enter minutes',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      final tVm = context.read<TimerViewmodel>();
                      if (tVm.formKey.currentState!.validate()) {
                        tVm.beginStopwatch();
                      }
                    },
                    child: const Text("Begin Stopwatch"))
              ] else ...[
                Text(
                  // "${tVm.hours}:${tVm.minutes}:${tVm.seconds}",
                  '${tVm.hours < 10 ? '0${tVm.hours}:' : '${tVm.hours}:'}${tVm.minutes < 10 ? '0${tVm.minutes}:' : '${tVm.minutes}:'}${tVm.seconds < 10 ? '0${tVm.seconds}' : '${tVm.seconds}'}',
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      final tVm = context.read<TimerViewmodel>();
                      tVm.cancelStopwatch();
                    },
                    child: const Text("Cancel"))
              ],
            ],
          ),
        ));
  }
}
