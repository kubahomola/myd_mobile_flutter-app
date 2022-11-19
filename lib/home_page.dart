import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/count_tracker_widget.dart';
import 'package:myd/utilities/widgets/counter_widget.dart';
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
      backgroundColor: const Color.fromARGB(100, 44, 48, 55),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NotesWidget(),
            CounterWidget(),
            CountTrackerWidget(),
          ],
        ),
      ),
    );
  }
}
