import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/button_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class AuthenticationBodyWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String title;
  final String buttonText;
  final String suggestionText;
  final String questionText;
  final String routeName;
  final void Function()? onPressed;
  final void Function(String)? onChangedPassword;
  final void Function(String)? onChangedEmail;

  const AuthenticationBodyWidget({
    super.key,
    required this.title,
    required this.buttonText,
    required this.suggestionText,
    required this.questionText,
    required this.routeName,
    this.onPressed,
    this.onChangedPassword,
    this.onChangedEmail,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    const sizedBox_12 = SizedBox(height: 12);

    return Form(
      key: formKey,
      child: ListView(
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
          TextFieldWidget(
            hintText: 'Email',
            onChanged: onChangedEmail,
          ),
          const SizedBox(
            height: 8,
          ),
          TextFieldWidget(
            hintText: 'Password',
            onChanged: onChangedPassword,
          ),
          sizedBox_12,
          ButtonWidget(
            text: buttonText,
            onPressed: onPressed,
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
      ),
    );
  }
}
