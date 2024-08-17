class SignupState {}

class InitialSignupState extends SignupState {}

class LoadingSignupState extends SignupState {}

class SuccessSignupState extends SignupState {}

class FailureSignupState extends SignupState {
  final String errorMessage;

  FailureSignupState({required this.errorMessage});
}
