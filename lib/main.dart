import 'package:chat_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/blocs/chat_bloc/chat_bloc.dart';
import 'package:chat_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:chat_app/views/cubit_views/chat_view_cubit.dart';
import 'package:chat_app/views/bloc_views/chat_view_bloc.dart';
import 'package:chat_app/views/cubit_views/login_view_cubit.dart';
import 'package:chat_app/views/bloc_views/login_view_bloc.dart';
import 'package:chat_app/views/cubit_views/signup_view_cubit.dart';
import 'package:chat_app/views/bloc_views/signup_view_bloc.dart';
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
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ChatBloc()),
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
          kSignupCubitRoute: (context) => const SignupCubitView(),
          kLoginCubitRoute: (context) => const LoginCubitView(),
          kChatCubitRoute: (context) => const ChatViewCubit(),
          kSignupBlocRoute: (context) => const SignupBlocView(),
          kLoginBlocRoute: (context) => const LoginBlocView(),
          kChatBlocRoute: (context) => const ChatViewBloc(),
        },
        initialRoute: kLoginBlocRoute,
        // initialRoute: kLoginCubitRoute,
      ),
    );
  }
}
