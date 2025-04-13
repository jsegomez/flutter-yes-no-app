import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final inputDecoration = InputDecoration(
      hintText: 'Termina tu mensaje con un simbolo ?',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.text;
          print('valor: $textValue');
          textController.clear();
          focusNode.requestFocus();
        },
        icon: const Icon(Icons.send),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: TextFormField(
        focusNode: focusNode,
        onTapOutside: (event) => focusNode.unfocus(),
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          print('Message sent: $value');
          textController.clear();
          focusNode.requestFocus();
        },
        onChanged: (value) {
          print('Message changed: $value');
        },
      ),
    );
  }
}
