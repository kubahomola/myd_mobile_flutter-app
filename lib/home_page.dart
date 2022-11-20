import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myd/utilities/widgets/count_tracker_widget.dart';
import 'package:myd/utilities/widgets/counter_widget.dart';
import 'package:myd/utilities/widgets/habit_tracker_widget.dart';
import 'package:myd/utilities/widgets/notes_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 48, 55),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "MAKE YOUR DAY",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: const Color.fromARGB(255, 87, 153, 153),
                        child: const Icon(Icons.add,
                            size: 35, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              const NotesWidget(),
              const CounterWidget(),
              const CountTrackerWidget(),
              const HabitTrackerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
