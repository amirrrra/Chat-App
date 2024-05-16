import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  final MessageModel obj;
  final Color color;
  final double bottomLeft;
  final double bottomRight;
  final AlignmentGeometry alignment;

  const ChatBubbleWidget({
    super.key,
    required this.obj,
    required this.color,
    required this.bottomLeft,
    required this.bottomRight,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    const bubbleRadius = Radius.circular(32);
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: bubbleRadius,
              topRight: bubbleRadius,
              bottomRight: Radius.circular(bottomRight),
              bottomLeft: Radius.circular(bottomLeft)),
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

class ChatBubbleSenderWidget extends StatelessWidget {
  final MessageModel obj;

  const ChatBubbleSenderWidget({super.key, required this.obj});

  @override
  Widget build(BuildContext context) {
    return ChatBubbleWidget(
      obj: obj,
      color: kSentMessageColor,
      bottomLeft: 32,
      bottomRight: 0,
      alignment: Alignment.centerRight,
    );
  }
}
class ChatBubbleRecieverWidget extends StatelessWidget {
  final MessageModel obj;

  const ChatBubbleRecieverWidget({super.key, required this.obj});

  @override
  Widget build(BuildContext context) {
    return ChatBubbleWidget(
      obj: obj,
      color: kRecievedMessageColor,
      bottomLeft: 0,
      bottomRight: 32,
      alignment: Alignment.centerLeft,
    );
  }
}
