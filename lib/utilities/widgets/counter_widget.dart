import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/edit_title_text_field.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counterNumber = 0;

  void _counterIncreased() {
    setState(() {
      counterNumber++;
    });
  }

  void _counterDecreased() {
    setState(() {
      counterNumber--;
    });
  }

  void _counterReset() {
    setState(() {
      counterNumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const EditTitleTextField(),
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
                            counterNumber.toString(),
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
