import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/widgets/chat_bubble_widget.dart';
import 'package:chat_app/widgets/chat_text_field_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewBuilder extends StatelessWidget {
  const ChatViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    // One-time Read => FutureBuilder (listens to data only once then build)
    // Realtime Changes => StreamBuilder (always listening to data && build)

    return StreamBuilder<QuerySnapshot>(
      stream: ChatTextFieldWidget.messageReference.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              MessageModel.fromJson(snapshot.data!.docs[i]),
            );
          }
          return ChatView(
            itemBuilder: (BuildContext context, int index) {
              return ChatBubbleWidget(
                obj: messagesList[index],
              );
            },
            itemcount: messagesList.length,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: kSecondryColor,
            ),
          );
        }
      },
    );
  }
}
