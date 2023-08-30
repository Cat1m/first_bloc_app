class LoginState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;

  LoginState(
      {required this.isFailure,
      required this.isLoading,
      required this.isSuccess});

  factory LoginState.initial() {
    return LoginState(isFailure: true, isLoading: false, isSuccess: false);
  }
  factory LoginState.loading() {
    return LoginState(isFailure: false, isLoading: true, isSuccess: false);
  }
  factory LoginState.success() {
    return LoginState(isFailure: false, isLoading: false, isSuccess: true);
  }
  factory LoginState.failure() {
    return LoginState(isFailure: true, isLoading: false, isSuccess: false);
  }
}
