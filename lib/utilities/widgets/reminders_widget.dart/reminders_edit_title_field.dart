import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/edit_title_text_field.dart';

class RemindersEditTitleTextField extends StatefulWidget {
  final String initialText;

  const RemindersEditTitleTextField({
    Key? key,
    required this.initialText,
  }) : super(key: key);

  @override
  State<RemindersEditTitleTextField> createState() =>
      _RemindersEditTitleTextFieldState();
}

class _RemindersEditTitleTextFieldState
    extends State<RemindersEditTitleTextField> {
  //variables
  List remindersList = ["Dojít si nakoupit", "úkol - AJ"];
  bool _isEditing = true;
  final bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    if (_isEditing) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditTitleTextField(initialText: "Reminders"),
          ListView.builder(
              shrinkWrap: true,
              itemCount: remindersList.length,
              itemBuilder: ((context, index) {
                return Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                          onTap: (() {
                            setState(() {
                              (!_isDone);
                            });
                          }),
                          child: (_isDone)
                              ? const Icon(Icons.circle)
                              : const Icon(Icons.circle_outlined)),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        autocorrect: false,
                        onChanged: (value) {
                          setState(() {
                            if (value == "") {
                              setState(() {
                                remindersList.removeAt(index);
                              });
                            }
                          });
                        },
                        onFieldSubmitted: (value) {
                          remindersList[index] = value;
                          setState(() {
                            if (value == "") {
                              setState(() {
                                remindersList.removeAt(index);
                              });
                            }
                            _isEditing = false;
                          });
                        },
                        initialValue: remindersList[index],
                      ),
                    ),
                  ],
                );
              })),
          GestureDetector(
              onTap: () {
                setState(() {
                  remindersList.add("");
                  _isEditing = true;
                });
              },
              child: const Icon(
                Icons.add_circle_outlined,
              ))
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditTitleTextField(initialText: "Reminders"),
          ListView.builder(
            shrinkWrap: true,
            itemCount: remindersList.length,
            itemBuilder: ((context, index) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: (() {
                        setState(() {
                          (!_isDone);
                        });
                      }),
                      child: (_isDone)
                          ? const Icon(Icons.circle)
                          : const Icon(Icons.circle_outlined),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        setState(() {
                          _isEditing = true;
                        });
                      },
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      initialValue: remindersList[index],
                    ),
                  ),
                ],
              );
            }),
          )
        ],
      );
    }
  }
}
