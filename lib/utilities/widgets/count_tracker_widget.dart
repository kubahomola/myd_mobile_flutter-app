import 'package:flutter/material.dart';

class CountTrackerWidget extends StatefulWidget {
  const CountTrackerWidget({Key? key}) : super(key: key);

  @override
  State<CountTrackerWidget> createState() => _CountTrackerWidgetState();
}

class _CountTrackerWidgetState extends State<CountTrackerWidget> {
  int counterNumber = 0;
  int userNumber = 6;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _counterIncreased() {
    if (counterNumber < userNumber) {
      setState(() {
        counterNumber++;
      });
    }
  }

  void _counterDecreased() {
    if (counterNumber > 0) {
      setState(() {
        counterNumber--;
      });
    }
  }

  void _counterReset() {
    setState(() {
      counterNumber = 0;
    });
  }

  void _userInputDialog() {
    showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          content: TextField(
            keyboardType: TextInputType.number,
            controller: _controller,
          ),
          actions: [
            MaterialButton(
              onPressed: (() {
                setState(() {
                  userNumber = int.parse(_controller.text);
                });
                Navigator.of(context).pop();
                _controller.clear();
              }),
              child: const Text("OK"),
            ),
            MaterialButton(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              child: const Text("Cancel"),
            ),
          ],
        );
      }),
    );
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
                    onTap: _userInputDialog,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        alignment: const Alignment(0, 0),
                        height: 40,
                        width: 50,
                        color: const Color.fromARGB(100, 81, 85, 92),
                        child: Text(
                          "$counterNumber/$userNumber",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
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
