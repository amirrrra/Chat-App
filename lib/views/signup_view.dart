import 'package:chat_app/cubits/signup_cubit/signup_cubit.dart';
import 'package:chat_app/cubits/signup_cubit/signup_state.dart';
import 'package:chat_app/helper/snackbar_message.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/authentication_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String? email;
    String? password;

    Future<void> registrationOnPressed() async {
      if (formKey.currentState!.validate()) {
        BlocProvider.of<SignupCubit>(context).signup(
          email: email!,
          password: password!,
        );
      }
    }

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SuccessSignupState) {
          snackbarMessage(
            context,
            'Your account has been created successfully.',
          );
          Navigator.pushNamed(
            context,
            kLoginRoute,
          );
        } else if (state is FailureSignupState) {
          snackbarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
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
      },
    );
  }
}
