import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class MessageFieldBox extends StatefulWidget {
  const MessageFieldBox({super.key});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void handleSend() {
    final newMessage = _textController.text.trim();
    if (newMessage.isEmpty) return;

    context.read<ChatProvider>().sendMessage(newMessage);
    _textController.clear();
    _focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      hintText: 'Termina tu mensaje con un simbolo ?',
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
      suffixIcon: IconButton(
        onPressed: () {
          handleSend();
        },
        icon: const Icon(Icons.send),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: TextFormField(
        focusNode: _focusNode,
        onTapOutside: (event) => _focusNode.unfocus(),
        controller: _textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          handleSend();
        },
      ),
    );
  }
}
