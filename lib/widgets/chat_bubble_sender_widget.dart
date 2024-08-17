import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/chat_bubble_widget.dart';
import 'package:flutter/material.dart';

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