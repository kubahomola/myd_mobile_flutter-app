import 'package:flutter/material.dart';

class EditTitleTextField extends StatefulWidget {
  const EditTitleTextField({Key? key}) : super(key: key);

  @override
  State<EditTitleTextField> createState() => _EditTitleTextFieldState();
}

class _EditTitleTextFieldState extends State<EditTitleTextField> {
  //variables
  String initialText = "inial text";
  final TextEditingController _textEditingController = TextEditingController();

//pridat default text
// TextField(
//   controller: TextEditingController()..text = 'Your initial value',
//   onChanged: (text) => {},
// )

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: TextField(
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        autocorrect: false,
        onSubmitted: (value) {
          initialText = value;
          print(initialText);
        },
        controller: _textEditingController..text = initialText,
      ),
    );
  }
}
