import 'package:chat_app/helper/snackbar_message.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/authentication_body_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationBodyWidget(
        title: 'SIGNUP',
        buttonText: 'Signup',
        suggestionText: 'Log In',
        questionText: "Already have an account? ",
        routeName: kLoginRoute,
        onPressed: registrationOnPressed,
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

  Future<void> userRegistration() async {
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  Future<void> registrationOnPressed() async {
    if (formKey.currentState!.validate()) {
      try {
        await userRegistration();
        if (context.mounted) {
          snackbarMessage(
            context,
            'Your account has been created successfully.',
          );
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          if (context.mounted) {
            snackbarMessage(
              context,
              'Weak Password',
            );
          }
        } else if (e.code == 'email-already-in-use') {
          if (context.mounted) {
            snackbarMessage(
              context,
              'Email already in used',
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
