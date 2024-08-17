import 'package:chat_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/views/chat_view.dart';
import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  // main is async => binding must be initialized
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    var defaultTextTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          fontFamily: 'Gilroy-Medium',
          textTheme: defaultTextTheme.apply(
            bodyColor: kWhite,
            displayColor: kWhite,
          ),
        ),
        routes: {
          kSignupRoute: (context) => const SignupView(),
          kLoginRoute: (context) => const LoginView(),
          kChatRoute: (context) => const ChatView(),
        },
        home: const LoginView(),
        // home: const ChatViewBuilder(),
      ),
    );
  }
}
