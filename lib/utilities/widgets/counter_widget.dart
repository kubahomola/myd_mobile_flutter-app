import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myd/data/database.dart';
import 'package:myd/utilities/widgets/edit_title_text_field.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  CounterWidgetDataBase cd = CounterWidgetDataBase();

  @override
  void initState() {
    if (_myBox.get("COUNTERNUMBER") == null) {
      cd.createInitailData();
    } else {
      cd.loadData();
    }
    super.initState();
  }

  final _myBox = Hive.box('mybox');

  void _counterIncreased() {
    setState(() {
      cd.counterNumber++;
      cd.updateData();
    });
  }

  void _counterDecreased() {
    setState(() {
      cd.counterNumber--;
      cd.updateData();
    });
  }

  void _counterReset() {
    setState(() {
      cd.counterNumber = 0;
      cd.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        EditTitleTextField(
          initialText: "Counter1",
          height: 25,
        ),
        GestureDetector(
          onDoubleTap: _counterReset,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 40,
              alignment: const Alignment(0, 0),
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(8.5),
                child: Text(
                  cd.counterNumber.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              child: GestureDetector(
                onTap: _counterDecreased,
                child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                  height: 40,
                  width: 70,
                  // color: const Color.fromARGB(255, 44, 48, 55),
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              child: GestureDetector(
                onTap: _counterIncreased,
                child: Container(
                  height: 40,
                  width: 70,
                  color: Theme.of(context).colorScheme.tertiary,
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
