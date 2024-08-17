class AuthState{}

class InitialAuthState extends AuthState {}

class LoadingLoginState extends AuthState {}

class SuccessLoginState extends AuthState {}

class FailureLoginState extends AuthState {
  final String errorMessage;

  FailureLoginState({required this.errorMessage});
}

class LoadingSignupState extends AuthState {}

class SuccessSignupState extends AuthState {}

class FailureSignupState extends AuthState {
  final String errorMessage;

  FailureSignupState({required this.errorMessage});
}
