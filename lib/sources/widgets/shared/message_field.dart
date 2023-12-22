import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageField({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textHandler = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextFormField(
          onTapOutside: (event) {
            focusNode.unfocus();
          },
          onFieldSubmitted: (value) {
            textHandler.clear();
            focusNode.requestFocus();
            onValue(value);
          },
          focusNode: focusNode,
          controller: textHandler,
          decoration: InputDecoration(
            hintText: "Mensaje",
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            filled: true,
            suffixIcon: IconButton(
                icon: const Icon(Icons.send_outlined),
                onPressed: () {
                  final textValue = textHandler.value.text;
                  onValue(textValue);
                  focusNode.requestFocus();
                }),
          )),
    );
  }
}
