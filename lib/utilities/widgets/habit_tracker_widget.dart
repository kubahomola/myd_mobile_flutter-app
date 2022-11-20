import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/edit_title_text_field.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HabitTrackerWidget extends StatelessWidget {
  const HabitTrackerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(80, 217, 217, 217),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: GestureDetector(
                    child: Container(
                      height: 80,
                      width: 80,
                      color: const Color.fromARGB(255, 81, 85, 92),
                      child: CircularPercentIndicator(
                        radius: 32,
                        lineWidth: 7,
                        percent: 0.67,
                        progressColor: const Color.fromARGB(255, 87, 153, 153),
                        center: const Icon(Icons.play_arrow,
                            color: Colors.white, size: 35),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  EditTitleTextField(),
                  Text("5:00/10:00 | 50%")
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30.0, left: 60),
                child: Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
