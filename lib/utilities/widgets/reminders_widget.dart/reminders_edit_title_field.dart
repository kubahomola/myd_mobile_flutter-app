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
  List remindersList = [
    ["Zavolat doktorovi", false],
    ["úkol - AJ", false],
  ];
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditTitleTextField(
          initialText: "Reminders",
          height: 25,
        ),
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
                            (remindersList[index][1] =
                                !(remindersList[index][1]));
                          });
                        }),
                        child: (remindersList[index][1])
                            ? const Icon(
                                Icons.circle,
                                size: 25,
                              )
                            : const Icon(
                                Icons.circle_outlined,
                                size: 25,
                              )),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        autocorrect: false,
                        onTap: (() {
                          setState(() {
                            _isEditing = true;
                          });
                        }),
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
                              remindersList.removeAt(index);
                            }
                            _isEditing = false;
                          });
                        },
                        initialValue: remindersList[index][0],
                      ),
                    ),
                  ),
                ],
              );
            })),
        Visibility(
          visible: _isEditing,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  remindersList.add("");
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.add_circle_outlined,
                ),
              )),
        )
      ],
    );
  }
}
