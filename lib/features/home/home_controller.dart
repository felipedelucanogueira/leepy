import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  double duration = 1;
  double start = 0;
  bool isActive = false;

  timerfunc() {
    duration = duration * 60;
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (isActive == false) {
          timer.cancel();
        }
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

  bool enableKeyboard() {
    if (isActive == true) {
      return false;
    } else {
      return true;
    }
  }

  stopTimer() {
    isActive = false;
    start = 0;
    duration = 1;
    notifyListeners();
  }
}
