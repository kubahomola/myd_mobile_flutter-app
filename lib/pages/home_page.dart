import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myd/data/database.dart';
import 'package:myd/utilities/widgets/count_tracker_widget.dart';
import 'package:myd/utilities/widgets/counter_widget.dart';
import 'package:myd/utilities/widgets/habit_tracker/habit_tracker_widget.dart';
import 'package:myd/utilities/widgets/notes_widget/notes_widget.dart';

import '../utilities/widgets/reminders_widget.dart/reminders_widget.dart';

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
      return const Text("Add your first widget");
  }
}

class _HomePageState extends State<HomePage> {
  WidgetDataBase db = WidgetDataBase();

  @override
  void initState() {
    if (_myBox.get("WIDGETLIST") == null) {
      db.createInitailData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _myBox = Hive.box('mybox');

  void removeWidget(int index) {
    setState(() {
      db.widgetList.removeAt(index);
      db.updateData();
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
                          db.widgetList.add(1);
                          break;
                        case MenuItem.countTracker:
                          db.widgetList.add(2);
                          break;
                        case MenuItem.notes:
                          db.widgetList.add(3);
                          break;
                        case MenuItem.reminders:
                          db.widgetList.add(4);
                          break;
                        case MenuItem.habitTracker:
                          db.widgetList.add(5);
                          break;
                      }
                      db.updateData();
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
              itemCount: db.widgetList.length,
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
                                        db.updateData();
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
                                        db.widgetList[index] == 5 ? 5 : 20),
                                    child: getWidgetType(db.widgetList[index])),
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
