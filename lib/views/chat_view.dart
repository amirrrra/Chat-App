import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/app_bar_widget.dart';
import 'package:chat_app/widgets/chat_bubble_list_widget.dart';
import 'package:chat_app/widgets/chat_text_field_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static const String chatRoute = 'Chat View';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: ChatTextFieldWidget.messageReference.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Scaffold(
            backgroundColor: kChatColor,
            appBar: AppBarWidget(),
            body: Column(
              children: [
                Expanded(
                  child: ChatBubbleListWidget(),
                ),
                ChatTextFieldWidget(),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
