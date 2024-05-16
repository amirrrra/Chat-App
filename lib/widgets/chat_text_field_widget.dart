import 'package:chat_app/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatTextFieldWidget extends StatelessWidget {
  final String email;
  const ChatTextFieldWidget({
    super.key,
    required this.email,
  });

  static CollectionReference messageReference =
      FirebaseFirestore.instance.collection(kMessageCollection);
  static ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    void sendMessage() {
      messageReference.add({
        kMessage: messageController.text,
        kTime: DateTime.now(),
        kEmail: email,
      });
      messageController.clear();
      scrollController.animateTo(
        0,
        duration: const Duration(
          milliseconds: 1,
        ),
        curve: Curves.easeIn,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextField(
        controller: messageController,
        cursorColor: kSecondryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: kPrimaryColor,
          hintText: 'Send Message',
          hintStyle: const TextStyle(
            color: kGrey,
          ),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              sendMessage();
            },
            icon: const Icon(
              Icons.send,
              color: kSecondryColor,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
