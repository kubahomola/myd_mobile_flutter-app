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
  List notesList = ["Školní náměstí 1605", "Filmy : Blackbox"];
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EditTitleTextField(
          initialText: "Notes",
          height: 25,
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: notesList.length,
            itemBuilder: ((context, index) {
              return SizedBox(
                height: 25,
                child: TextFormField(
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  autocorrect: false,
                  onTap: () {
                    setState(() {
                      _isEditing = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      if (value == "") {
                        setState(() {
                          notesList.removeAt(index);
                          _isEditing = false;
                        });
                      }
                    });
                  },
                  onFieldSubmitted: (value) {
                    notesList[index] = value;
                    setState(() {
                      if (value == "") {
                        notesList.removeAt(index);
                      }
                      _isEditing = false;
                    });
                  },
                  initialValue: notesList[index],
                ),
              );
            })),
        Visibility(
          visible: _isEditing,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  notesList.add("");
                });
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.add_circle_outlined,
                ),
              )),
        )
      ],
    );
  }
}
