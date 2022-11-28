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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                RemindersEditTitleTextField(
                  initialText: "Reminders",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
