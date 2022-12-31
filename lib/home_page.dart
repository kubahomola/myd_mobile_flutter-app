import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:myd/utilities/widgets/count_tracker_widget.dart';
import 'package:myd/utilities/widgets/counter_widget.dart';
import 'package:myd/utilities/widgets/custom_widget_container.dart';
import 'package:myd/utilities/widgets/habit_tracker/habit_tracker_widget.dart';
import 'package:myd/utilities/widgets/notes_widget/notes_widget.dart';

import 'utilities/widgets/reminders_widget.dart/reminders_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum MenuItem { counter, countTracker, notes, reminders, habitTracker }

List<Widget> widget = const [
  CounterWidget(),
  CountTrackerWidget(),
  NotesWidget(),
  RemindersWidget(),
  HabitTrackerWidget()
];
List widgetList = [1, 3];

Widget getWidgetType(int widgetNumber) {
  switch (widgetNumber) {
    case 1:
      return const CounterWidget();
    case 2:
      return const CountTrackerWidget();
    case 3:
      return const NotesWidget();
    case 4:
      return const RemindersWidget();
    case 5:
      return const HabitTrackerWidget();
    default:
      return const Text("Add your widget");
  }
}

class _HomePageState extends State<HomePage> {
  void removeWidget(int index) {
    setState(() {
      widgetList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("MAKE YOUR DAY"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                child: PopupMenuButton(
                  icon: const Icon(Icons.add, size: 35),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  itemBuilder: ((context) => <PopupMenuEntry<MenuItem>>[
                        const PopupMenuItem<MenuItem>(
                          value: MenuItem.counter,
                          child: ListTile(
                            title: Text("Counter"),
                          ),
                        ),
                        const PopupMenuItem<MenuItem>(
                          value: MenuItem.countTracker,
                          child: ListTile(
                            title: Text("CountTracker"),
                          ),
                        ),
                        const PopupMenuItem<MenuItem>(
                          value: MenuItem.notes,
                          child: ListTile(
                            title: Text("Notes"),
                          ),
                        ),
                        const PopupMenuItem<MenuItem>(
                          value: MenuItem.reminders,
                          child: ListTile(
                            title: Text("Reminders"),
                          ),
                        ),
                        const PopupMenuItem<MenuItem>(
                          value: MenuItem.habitTracker,
                          child: ListTile(
                            title: Text("HabitTracker"),
                          ),
                        ),
                      ]),
                  onSelected: ((value) {
                    setState(() {
                      switch (value) {
                        case MenuItem.counter:
                          widgetList.add(1);
                          break;
                        case MenuItem.countTracker:
                          widgetList.add(2);
                          break;
                        case MenuItem.notes:
                          widgetList.add(3);
                          break;
                        case MenuItem.reminders:
                          widgetList.add(4);
                          break;
                        case MenuItem.habitTracker:
                          widgetList.add(5);
                          break;
                      }
                    });
                  }),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
                child: ListView.builder(
              itemCount: widgetList.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Wrap(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Slidable(
                              endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      onPressed: (context) {
                                        removeWidget(index);
                                      },
                                      backgroundColor: Colors.redAccent,
                                      icon: Icons.cancel_rounded,
                                    ),
                                  ]),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(
                                        widgetList[index] == 5 ? 5 : 20),
                                    child: getWidgetType(widgetList[index])),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
            )),
          ]),
        ),
      ),
    );
  }
}
