import 'package:chat_app/models/message_model.dart';
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



