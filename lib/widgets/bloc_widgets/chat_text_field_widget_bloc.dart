import 'package:chat_app/blocs/chat_bloc/chat_bloc.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextFieldWidgetBloc extends StatelessWidget {
  final String email;
  const ChatTextFieldWidgetBloc({
    super.key,
    required this.email,
  });

  static ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    void sendMessage() {
      BlocProvider.of<ChatBloc>(context).add(
        SendEvent(
          message: messageController.text,
          email: email,
        ),
      );
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
