import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Gilroy-Medium',
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: black,
            ),
          )),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
