import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/button_widget.dart';
import 'package:chat_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    const sizedBox_12 = SizedBox(height: 12);
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
          const ButtonWidget(
            text: 'Login',
          ),
          sizedBox_12,
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account? ",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: (){},
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
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
