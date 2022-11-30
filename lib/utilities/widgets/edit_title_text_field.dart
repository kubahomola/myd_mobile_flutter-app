import 'package:flutter/material.dart';

class EditTitleTextField extends StatelessWidget {
  //variables
  String initialText;
  double height;

  EditTitleTextField({
    Key? key,
    required this.initialText,
    required this.height,
  }) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: height,
      child: TextField(
        style:
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        autocorrect: false,
        onSubmitted: (value) {
          initialText = value;
        },
        controller: _textEditingController..text = initialText,
      ),
    );
  }
}
