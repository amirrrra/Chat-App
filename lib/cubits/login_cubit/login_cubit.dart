import 'package:chat_app/cubits/login_cubit/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialLoginState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginState());
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SuccessLoginState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        emit(FailureLoginState(errorMessage: 'Wrong Password'));
      } else if (e.code == 'user-not-found') {
        emit(FailureLoginState(errorMessage: 'User not found'));
      } else if (e.code == 'invalid-email') {
        emit(FailureLoginState(errorMessage: 'Invalid Email'));
      } else if (e.code == 'user-disabled') {
        emit(FailureLoginState(errorMessage: 'User had been disabled'));
      } else {
        emit(FailureLoginState(errorMessage: 'Login failed'));
      }
    } catch (e) {
      emit(FailureLoginState(errorMessage: 'There is an error ,try later'));
    }
  }
}
