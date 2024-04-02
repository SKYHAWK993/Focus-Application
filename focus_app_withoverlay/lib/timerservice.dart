import 'package:flutter/material.dart';
import 'dart:async';

class timerservice extends ChangeNotifier {
  late Timer timer;
  double currentduration = 1500;
  double selectedTime = 1500;
  double rest = 300;
  double longrest = 1500;
  String mode = 'ON';
  bool timerPlaying = false;
  int rounds = 0;
  int goal = 0;
  String currentState = "FOCUS";

  bool isTimerRunning() {
    return timerPlaying;
  }

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentduration == 0) {
        handleNextRound();
      } else {
        currentduration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentState = "FOCUS";
    currentduration = selectedTime = 1500;
    rest = 300;
    longrest = 1500;
    rounds = goal = 0;
    timerPlaying = false;
    notifyListeners();
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentduration = seconds;
    notifyListeners();
  }

  void selectRest(double seconds) {
    rest = seconds;
    //currentduration = seconds;
    notifyListeners();
  }

  void selectMode(String smode) {
    mode = smode;
    //currentduration = seconds;
    notifyListeners();
  }

  void selectLongRest(double seconds) {
    longrest = seconds;
    //currentduration = seconds;
    notifyListeners();
  }

  void handleNextRound() {
    if (currentState == "FOCUS" && rounds != 3) {
      currentState = "BREAK";
      currentduration = rest;
      //selectedTime = 300;
      rounds++;
      goal++;
    } else if (currentState == "BREAK") {
      currentState = "FOCUS";
      currentduration = selectedTime;
      //selectedTime = 1500;
    } else if (currentState == "FOCUS" && rounds == 3) {
      currentState = "LONG BREAK";
      currentduration = longrest;
      //selectedTime = 1500;
      rounds++;
      goal++;
    } else if (currentState == "LONG BREAK") {
      currentState = "FOCUS";
      currentduration = selectedTime;
      //selectedTime = 1500;
      rounds = 0;
    }
    notifyListeners();
  }
}
