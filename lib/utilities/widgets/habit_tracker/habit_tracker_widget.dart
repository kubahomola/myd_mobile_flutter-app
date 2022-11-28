import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/habit_tracker/habit_tracker_functions.dart';

class HabitTrackerWidget extends StatefulWidget {
  const HabitTrackerWidget({Key? key}) : super(key: key);

  @override
  State<HabitTrackerWidget> createState() => _HabitTrackerWidgetState();
}

class _HabitTrackerWidgetState extends State<HabitTrackerWidget> {
  List habitList = [false, "Name", 1, 0];

  void habitStarted() {
    //note what start time is
    var startTime = DateTime.now();

    //include elapsed time
    int elapsedTime = habitList[3];

    //habit started and stopped
    setState(() {
      habitList[0] = !habitList[0];
    });

    if (habitList[0]) {
      //counting time
      Timer.periodic(
        const Duration(seconds: (1)),
        ((timer) {
          setState(() {
            //chceck stop time
            if (!habitList[0]) {
              timer.cancel();
            }
            //calculate elapsed time
            var currentTime = DateTime.now();
            habitList[3] = elapsedTime +
                currentTime.second -
                startTime.second +
                60 * (currentTime.minute - startTime.minute) +
                3600 * (currentTime.hour - startTime.hour);
          });

          //check if its completed
          if (elapsedTime == habitList[2]) {
            timer.cancel();
          }
        }),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return HabitTracker(
      isHabitRunning: habitList[0],
      habitName: habitList[1],
      timeGoal: habitList[2],
      timeSpent: habitList[3],
      onTap: () {
        habitStarted();
      },
      settingsTapped: () {},
    );
  }
}
