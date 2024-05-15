import 'package:chat_app/builders/chat_view_builder.dart';
import 'package:chat_app/widgets/chat_bubble_widget.dart';
import 'package:flutter/material.dart';

class ChatBubbleListWidget extends StatelessWidget {
  const ChatBubbleListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ChatViewBuilder.messagesList.length,
      itemBuilder: (BuildContext context, int index) {
        return ChatBubbleWidget(
          obj: ChatViewBuilder.messagesList[index],
        );
      },
    );
  }
}
