import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: babyYellow,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          const SizedBox(
            height: 100,
          ),
          Image.asset(
            'assets/images/online_chat.png',
            width: 88,
            height: 88,
          ),
          const SizedBox(
            height: 12,
          ),
          const Center(
            child: Text(
              'Online Chatting',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          const Text(
            'LOGIN',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const TextFieldWidget(
            hintText: 'Email',
          ),
          const SizedBox(
            height: 8,
          ),
          const TextFieldWidget(
            hintText: 'Password',
          ),
        ],
      ),
    );
  }
}
