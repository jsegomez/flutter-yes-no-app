import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final String message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Container(
            decoration: BoxDecoration(
              color: colors.primary,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(message, style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
