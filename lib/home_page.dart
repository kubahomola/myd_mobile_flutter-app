import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/count_tracker_widget.dart';
import 'package:myd/utilities/widgets/counter_widget.dart';
import 'package:myd/utilities/widgets/custom_app_bar.dart';
import 'package:myd/utilities/widgets/habit_tracker/habit_tracker_widget.dart';
import 'package:myd/utilities/widgets/notes_widget/notes_widget.dart';

import 'utilities/widgets/reminders_widget.dart/reminders_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const CustomAppBar(),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: const [
                  NotesWidget(),
                  //CounterWidget(),
                  CountTrackerWidget(),
                  HabitTrackerWidget(),
                  RemindersWidget(),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
