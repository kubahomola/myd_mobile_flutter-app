import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/edit_title_text_field.dart';

class NotesEditTitleTextField extends StatefulWidget {
  final String initialText;

  const NotesEditTitleTextField({
    Key? key,
    required this.initialText,
  }) : super(key: key);

  @override
  State<NotesEditTitleTextField> createState() =>
      _NotesEditTitleTextFieldState();
}

class _NotesEditTitleTextFieldState extends State<NotesEditTitleTextField> {
  //variables
  List notesList = ["Dojít si nakoupit", "úkol - AJ"];
  bool _isEditing = true;

  @override
  Widget build(BuildContext context) {
    if (_isEditing) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditTitleTextField(initialText: "Notes"),
          ListView.builder(
              shrinkWrap: true,
              itemCount: notesList.length,
              itemBuilder: ((context, index) {
                return TextFormField(
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  autocorrect: false,
                  onFieldSubmitted: (value) {
                    notesList[index] = value;
                    setState(() {
                      if (notesList[index] == "") {
                        setState(() {
                          notesList.removeAt(index);
                        });
                      }
                      _isEditing = false;
                    });
                  },
                  initialValue: notesList[index],
                );
              })),
          GestureDetector(
              onTap: () {
                setState(() {
                  notesList.add(" ");
                  _isEditing = true;
                });
              },
              child: const Icon(
                Icons.add_circle_outline,
              ))
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EditTitleTextField(initialText: "Notes"),
          ListView.builder(
              shrinkWrap: true,
              itemCount: notesList.length,
              itemBuilder: ((context, index) {
                return TextFormField(
                  onTap: () {
                    setState(() {
                      _isEditing = true;
                    });
                  },
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  initialValue: notesList[index],
                );
              }))
        ],
      );
    }
  }
}
