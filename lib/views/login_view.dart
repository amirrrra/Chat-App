import 'package:chat_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/cubits/auth_cubit/auth_state.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/helper/snackbar_message.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/widgets/authentication_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    String? email;
    String? password;

    Future<void> loginOnPressed() async {
      if (formKey.currentState!.validate()) {
        await BlocProvider.of<AuthCubit>(context).login(
          email: email!,
          password: password!,
        );
      }
    }

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SuccessLoginState) {
          Navigator.pushNamed(
            context,
            kChatRoute,
            arguments: email,
          );
          BlocProvider.of<ChatCubit>(context).getMessages();
        } else if (state is FailureLoginState) {
          snackbarMessage(
            context,
            state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is LoadingLoginState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : AuthenticationBodyWidget(
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
      },
    );
  }
}
