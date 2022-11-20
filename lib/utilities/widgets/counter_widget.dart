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
                color: const Color.fromARGB(80, 217, 217, 217),
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
                        alignment: const Alignment(0, 0),
                        height: 40,
                        width: 40,
                        color: const Color.fromARGB(255, 81, 85, 92),
                        child: Text(
                          counterNumber.toString(),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
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
                            height: 40,
                            width: 70,
                            color: const Color.fromARGB(255, 44, 48, 55),
                            child:
                                const Icon(Icons.remove, color: Colors.white),
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
                            color: const Color.fromARGB(255, 87, 153, 153),
                            child: const Icon(Icons.add, color: Colors.white),
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
