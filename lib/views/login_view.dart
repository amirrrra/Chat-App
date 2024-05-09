import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/authentication_body_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String signupRoute = 'Signup View';
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: babyYellow,
      body: AuthenticationBodyWidget(
        title: 'LOGIN',
        buttonText: 'Login',
        suggestionText: 'Sign Up',
        questionText: "Don't have an account? ",
        routeName: signupRoute,
      ),
    );
  }
}
