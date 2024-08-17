part of 'auth_bloc.dart';

sealed class AuthBlocState {}

final class InitialAuthBloc extends AuthBlocState {}

class InitialAuthBlocState extends AuthBlocState {}

class LoadingLoginState extends AuthBlocState {}

class SuccessLoginState extends AuthBlocState {}

class FailureLoginState extends AuthBlocState {
  final String errorMessage;

  FailureLoginState({required this.errorMessage});
}

class LoadingSignupState extends AuthBlocState {}

class SuccessSignupState extends AuthBlocState {}

class FailureSignupState extends AuthBlocState {
  final String errorMessage;

  FailureSignupState({required this.errorMessage});
}