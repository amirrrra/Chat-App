import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/button_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class AuthenticationBodyWidget extends StatelessWidget {
  final String title;
  final String buttonText;
  final String suggestionText;
  final String questionText;
  final String routeName;

  const AuthenticationBodyWidget({
    super.key,
    required this.title,
    required this.buttonText,
    required this.suggestionText,
    required this.questionText,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    const sizedBox_12 = SizedBox(height: 12);

    return ListView(
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
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        sizedBox_12,
        const TextFieldWidget(
          hintText: 'Email',
        ),
        const SizedBox(
          height: 8,
        ),
        const TextFieldWidget(
          hintText: 'Password',
        ),
        sizedBox_12,
        ButtonWidget(
          text: buttonText,
        ),
        sizedBox_12,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questionText,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  routeName,
                );
              },
              child: Text(
                suggestionText,
                style: const TextStyle(
                  color: blue,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
