import 'package:flutter/material.dart';
import 'package:myd/utilities/widgets/reminders_widget.dart/reminders_edit_title_field.dart';

class RemindersWidget extends StatefulWidget {
  const RemindersWidget({Key? key}) : super(key: key);

  @override
  State<RemindersWidget> createState() => _RemindersWidgetState();
}

class _RemindersWidgetState extends State<RemindersWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        RemindersEditTitleTextField(
          initialText: "Reminders",
        ),
      ],
    );
  }
}
