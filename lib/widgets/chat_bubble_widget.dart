import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  final MessageModel obj;
  const ChatBubbleWidget({
    super.key,
    required this.obj,
  });

  @override
  Widget build(BuildContext context) {
    const bubbleRadius = Radius.circular(32);
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4,),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: kRecievedMessageColor,
          borderRadius: BorderRadius.only(
            topLeft: bubbleRadius,
            topRight: bubbleRadius,
            bottomRight: bubbleRadius,
          ),
        ),
        child: Text(
          obj.message,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
