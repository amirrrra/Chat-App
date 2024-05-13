import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const bubbleRadius = Radius.circular(32);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: kRecievedMessageColor,
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
      ),
    );
  }
}
