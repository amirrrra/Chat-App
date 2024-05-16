import 'package:chat_app/helper/snackbar_message.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/authentication_body_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

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
      body: AuthenticationBodyWidget(
        title: 'LOGIN',
        buttonText: 'Login',
        suggestionText: 'Sign Up',
        questionText: "Don't have an account? ",
        routeName: kSignupRoute,
        onPressed: loginOnPressed,
        onChangedEmail: (data) {
          email = data;
        },
        onChangedPassword: (data) {
          password = data;
        },
        formKey: formKey,
      ),
    );
  }

  Future<void> userLogin() async {
    var auth = FirebaseAuth.instance;
    await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  Future<void> loginOnPressed() async {
    if (formKey.currentState!.validate()) {
      try {
        await userLogin();
        if (context.mounted) {
          Navigator.pushNamed(
            context,
            kChatRoute,
            arguments: email,
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          if (context.mounted) {
            snackbarMessage(
              context,
              'Wrong Password',
            );
          }
        } else if (e.code == 'user-not-found') {
          if (context.mounted) {
            snackbarMessage(
              context,
              'User not found',
            );
          }
        }
      } catch (e) {
        if (context.mounted) {
          snackbarMessage(
            context,
            'There is an error ,try later',
          );
        }
      }
    }
  }
}
