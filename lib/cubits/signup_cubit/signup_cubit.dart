import 'package:chat_app/cubits/signup_cubit/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(InitialSignupState());

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
}
