import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class CounterVm extends ChangeNotifier {
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 1);
  Duration remainingDuration = Duration(minutes: 1);
  Timer? timer;
  String strDigits(int n) => n.toString().padLeft(2, '0');


  void backgroundTask() async {

  }

  startNow() async {
    // Start the background service
    final service = await FlutterBackgroundService();
    await FlutterBackgroundService().startService();

    await service.configure(
      androidConfiguration: AndroidConfiguration(
        // this will be executed when app is in foreground or background in separated isolate
        onStart: onStart,
        // auto start service
        autoStart: true,
        isForegroundMode: true,
        notificationChannelId: 'Channel', // this must match with notification channel you created above.
        initialNotificationTitle: 'AWESOME SERVICE',
        initialNotificationContent: 'Initializing',
        foregroundServiceNotificationId: 90,
      ),
      iosConfiguration: IosConfiguration(),
    );
  }



  void stopTimer() {
    countdownTimer!.cancel();
    notifyListeners();
  }

  // Step 5
  void resetTimer() {
    stopTimer();
    myDuration = Duration(days: 5);
    notifyListeners();
  }

  // Step 6
  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
    }
    notifyListeners();
  }
}
Future<void> onStart(ServiceInstance service) async {
  Duration remainingDuration = Duration(minutes: 1);
  DartPluginRegistrant.ensureInitialized();
  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (remainingDuration.isNegative) {
    } else {
      remainingDuration -= const Duration(seconds: 1);
    }
  });
}