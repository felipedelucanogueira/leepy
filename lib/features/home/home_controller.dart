import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  double duration = 1;
  double start = 0;
  bool isActive = false;

  Future<void> timerfunc() async {
    duration = duration * 60;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (start < duration && isActive) {
          start++;
          notifyListeners();
        } else if (start == duration) {
          Process.run('pmset', ['sleepnow']);
          timer.cancel();
          isActive = false;
        }
      },
    );
  }

  stopTimer() {
    isActive = false;
    start = 0;
    duration = 1;
    notifyListeners();
  }
}
