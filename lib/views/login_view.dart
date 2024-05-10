import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/authentication_body_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const String signupRoute = 'Signup View';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: babyYellow,
      body: AuthenticationBodyWidget(
        title: 'LOGIN',
        buttonText: 'Login',
        suggestionText: 'Sign Up',
        questionText: "Don't have an account? ",
        routeName: LoginView.signupRoute,
        formKey: formKey,
      ),
    );
  }
}
