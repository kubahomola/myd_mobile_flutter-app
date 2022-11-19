import 'package:flutter/material.dart';

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
                color: const Color.fromARGB(60, 217, 217, 217),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Counter",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: _counterReset,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        alignment: const Alignment(0, 0),
                        height: 40,
                        width: 40,
                        color: const Color.fromARGB(100, 81, 85, 92),
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
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: _counterIncreased,
                          child: Container(
                            height: 40,
                            width: 70,
                            color: const Color.fromARGB(100, 87, 153, 153),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                        child: GestureDetector(
                          onTap: _counterDecreased,
                          child: Container(
                            height: 40,
                            width: 70,
                            color: const Color.fromARGB(100, 44, 48, 55),
                            child:
                                const Icon(Icons.remove, color: Colors.white),
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
