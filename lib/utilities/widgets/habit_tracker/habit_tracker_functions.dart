import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/edit_title_text_field.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTracker extends StatelessWidget {
  final bool isHabitRunning;
  final VoidCallback onTap;
  final VoidCallback settingsTapped;
  final int timeSpent;
  final int timeGoal;
  final String habitName;

  const HabitTracker({
    Key? key,
    required this.isHabitRunning,
    required this.onTap,
    required this.settingsTapped,
    required this.timeSpent,
    required this.timeGoal,
    required this.habitName,
  }) : super(key: key);

//convert seconds to min:sec
  String formatToMinSec(int totalseconds) {
    String sec = (totalseconds % 60).toString();
    String min = (totalseconds / 60).toStringAsFixed(5);

    //if secs is 1 digit number
    if (sec.length == 1) {
      sec = ('0$sec');
    }

    //if mins is 1 digit number
    if (min[1] == '.') {
      min = min.substring(0, 1);
    }
    return ('$min:$sec');
  }

  //completed in percents
  double percentCompleted() {
    return ((timeSpent / (timeGoal * 60)));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10, bottom: 10, right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 80,
                    width: 80,
                    color: Theme.of(context).colorScheme.primary,
                    child: CircularPercentIndicator(
                      radius: 32,
                      lineWidth: 7,
                      percent: percentCompleted(),
                      progressColor: Theme.of(context).colorScheme.tertiary,
                      center: (isHabitRunning)
                          ? const Icon(Icons.pause, size: 35)
                          : const Icon(Icons.play_arrow, size: 35),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditTitleTextField(
                  initialText: habitName,
                  height: 25,
                ),
                Text(
                  '${formatToMinSec(timeSpent)} / $timeGoal |  ${(percentCompleted() * 100).toStringAsFixed(0)}%',
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(
            30.0,
          ),
          child: GestureDetector(
            onTap: settingsTapped,
            child: const Icon(
              Icons.settings_outlined,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
