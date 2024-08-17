import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/chat_bubble_widget.dart';
import 'package:flutter/material.dart';

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
