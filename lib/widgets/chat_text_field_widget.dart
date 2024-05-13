import 'package:chat_app/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatTextFieldWidget extends StatelessWidget {
  const ChatTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: TextField(
        cursorColor: kSecondryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: kPrimaryColor,
          hintText: 'Send Message',
          hintStyle: const TextStyle(
            color: grey,
          ),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
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
