class LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  LoginState(
      {required this.isEmailValid,
      required this.isFailure,
      required this.isPasswordValid,
      required this.isSubmitting,
      required this.isSuccess});

  bool get isFormValid => isEmailValid && isPasswordValid;

  factory LoginState.initial() {
    return LoginState(
        isEmailValid: true,
        isFailure: false,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false);
  }

  factory LoginState.loading() {
    return LoginState(
        isEmailValid: true,
        isFailure: false,
        isPasswordValid: true,
        isSubmitting: true,
        isSuccess: false);
  }

  factory LoginState.failure() {
    return LoginState(
        isEmailValid: true,
        isFailure: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false);
  }

  factory LoginState.success() {
    return LoginState(
        isEmailValid: true,
        isFailure: false,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: true);
  }

  LoginState update({
    required bool isEmailValidU,
    required bool isPasswordValidU,
  }) {
    return copyWith(
        isEmailValidC: isEmailValidU,
        isPasswordValidC: isPasswordValidU,
        isSubmittingC: false,
        isSuccessC: false,
        isFailureC: false);
  }

  LoginState copyWith({
    required bool isEmailValidC,
    required bool isPasswordValidC,
    required bool isSubmittingC,
    required bool isSuccessC,
    required bool isFailureC,
  }) {
    return LoginState(
      isSuccess: isSuccessC,
      isSubmitting: isSubmittingC,
      isFailure: isFailureC,
      isEmailValid: isEmailValidC,
      isPasswordValid: isPasswordValidC,
    );
  }
}
