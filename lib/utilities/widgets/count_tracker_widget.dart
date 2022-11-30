import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/edit_title_text_field.dart';

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
          backgroundColor: const Color.fromARGB(255, 44, 48, 55),
          title: const Text("Select number",
              style: TextStyle(color: Colors.white)),
          content: TextField(
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            controller: _controller..text = "0",
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
              child: const Text(
                "OK",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: (() {
                Navigator.of(context).pop();
              }),
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.white),
              ),
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
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EditTitleTextField(
                    initialText: "Counter2",
                    height: 25,
                  ),
                  GestureDetector(
                    onDoubleTap: _counterReset,
                    onTap: _userInputDialog,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        alignment: const Alignment(0, 0),
                        color: Theme.of(context).colorScheme.primary,
                        child: Padding(
                          padding: const EdgeInsets.all(8.5),
                          child: Text(
                            "$counterNumber/$userNumber",
                            style: const TextStyle(
                              fontSize: 18,
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
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
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
                      ),
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
