import 'package:chat_app/widgets/chat_text_field_widget.dart';
import 'package:flutter/material.dart';

class ChatBubbleListWidget extends StatelessWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemcount;
  const ChatBubbleListWidget({
    super.key,
    required this.itemBuilder,
    required this.itemcount,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      controller: ChatTextFieldWidget.scrollController,
      itemCount: itemcount,
      itemBuilder: itemBuilder,
    );
  }
}
