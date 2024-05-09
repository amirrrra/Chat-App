import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/authentication_body_widget.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String loginRoute = 'Login View';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: babyYellow,
      body: AuthenticationBodyWidget(
        title: 'SIGNUP',
        buttonText: 'Signup',
        suggestionText: 'Log In',
        questionText: "Already have an account? ",
        routeName: loginRoute,
      ),
    );
  }
}
