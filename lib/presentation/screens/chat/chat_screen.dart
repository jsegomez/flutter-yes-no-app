import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(), body: _ChatView());
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Chat'),
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://cdn1.iconfinder.com/data/icons/user-pictures/100/male3-512.png',
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];
                  return message.fromWho == FromWho.me
                      ? MyMessageBubble(message: message.text)
                      : HerMessageBubble();
                },
              ),
            ),
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
