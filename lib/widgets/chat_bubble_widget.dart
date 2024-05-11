import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const bubbleRadius = Radius.circular(32);
    return Container(
      height: 64,
      width: 150,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.only(
        left: 16,
      ),
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: babyYellow,
        borderRadius: BorderRadius.only(
          topLeft: bubbleRadius,
          topRight: bubbleRadius,
          bottomRight: bubbleRadius,
        ),
      ),
      child: const Text(
        'hello, iam amira',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
