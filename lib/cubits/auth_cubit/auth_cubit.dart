import 'package:chat_app/cubits/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAuthState());

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    emit(LoadingSignupState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SuccessSignupState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        emit(FailureSignupState(errorMessage: 'Email already in use'));
      } else if (e.code == 'weak-password') {
        emit(FailureSignupState(errorMessage: 'Weak password'));
      } else if (e.code == 'invalid-email') {
        emit(FailureSignupState(errorMessage: 'Invalid Email'));
      } else if (e.code == 'network-request-failed') {
        emit(FailureSignupState(errorMessage: 'Network request Failed'));
      } else {
        emit(FailureSignupState(errorMessage: 'Login failed'));
      }
    } catch (e) {
      emit(FailureSignupState(errorMessage: e.toString()));
    }
  }

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
