import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/widgets/chat_text_field_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewBuilder extends StatelessWidget {
  static List<MessageModel> messagesList = [];

  const ChatViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: ChatTextFieldWidget.messageReference.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              MessageModel.fromJson(snapshot.data!.docs[i]),
            );
          }
          return const ChatView();
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
