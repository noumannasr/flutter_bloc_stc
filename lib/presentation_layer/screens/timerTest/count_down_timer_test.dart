import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/timerTest/counter_vm.dart';
import 'package:provider/provider.dart';

class TimerCountDownTest extends StatefulWidget {
  const TimerCountDownTest({super.key});

  @override
  State<TimerCountDownTest> createState() => _TimerCountDownTestState();
}

class _TimerCountDownTestState extends State<TimerCountDownTest> {

  @override
  void initState() {
    super.initState();
  }

  /// Timer related methods ///
  // Step 3


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('Count Down Timer'),),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => CounterVm(),
        child: Consumer<CounterVm>(
          builder: (context, counterVm, child) {
            // final days = counterVm.strDigits(counterVm.myDuration.inDays);
            // // Step 7
            // final hours = counterVm.strDigits(counterVm.myDuration.inHours.remainder(24));
            // final minutes = counterVm.strDigits(counterVm.myDuration.inMinutes.remainder(60));
            // final seconds = counterVm.strDigits(counterVm.myDuration.inSeconds.remainder(60));
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // Step 8
                  Text(
                    counterVm.remainingDuration.toString(),
                    //'$hours:$minutes:$seconds',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                  const SizedBox(height: 20),
                  // Step 9
                  ElevatedButton(
                    onPressed: counterVm.startNow,
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  // Step 10
                  ElevatedButton(
                    onPressed: () {
                      if (counterVm.countdownTimer == null || counterVm.countdownTimer!.isActive) {
                        counterVm.stopTimer();
                      }
                    },
                    child: const Text(
                      'Stop',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  // Step 11
                  ElevatedButton(
                      onPressed: () {
                        counterVm.resetTimer();
                      },
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
