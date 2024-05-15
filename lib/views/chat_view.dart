import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/app_bar_widget.dart';
import 'package:chat_app/widgets/chat_bubble_list_widget.dart';
import 'package:chat_app/widgets/chat_text_field_widget.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  final Widget? Function(BuildContext, int) itemBuilder;
  final int itemcount;
  const ChatView({
    super.key,
    required this.itemBuilder,
    required this.itemcount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kChatColor,
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          Expanded(
            child: ChatBubbleListWidget(
              itemBuilder: itemBuilder,
              itemcount: itemcount,
            ),
          ),
          const ChatTextFieldWidget(),
        ],
      ),
    );
  }
}
