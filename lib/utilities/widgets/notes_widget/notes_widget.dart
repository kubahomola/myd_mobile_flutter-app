import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/notes_widget/notes_edit_title_field.dart';

class NotesWidget extends StatefulWidget {
  const NotesWidget({Key? key}) : super(key: key);

  @override
  State<NotesWidget> createState() => _NotesWidgetState();
}

class _NotesWidgetState extends State<NotesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        NotesEditTitleTextField(
          initialText: "Notes",
        ),
      ],
    );
  }
}
