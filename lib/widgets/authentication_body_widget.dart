import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/authentication_button_widget.dart';
import 'package:chat_app/widgets/authentication_text_field_widget.dart';
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
            kLogo,
            width: 88,
            height: 88,
          ),
          const SizedBox(
            height: 12,
          ),
          const Center(
            child: Text(
              'Chitchat',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
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
          AuthenticationTextFieldWidget(
            hintText: 'Email',
            onChanged: onChangedEmail,
          ),
          const SizedBox(
            height: 8,
          ),
          AuthenticationTextFieldWidget(
            hintText: 'Password',
            onChanged: onChangedPassword,
            obscureText: true,
          ),
          sizedBox_12,
          AuthenticationButtonWidget(
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
                    color: kSecondryColor,
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
