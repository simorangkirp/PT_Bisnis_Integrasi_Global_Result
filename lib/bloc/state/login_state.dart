class LoginState {}

class OnloadLogin extends LoginState {}

class LoginInitState extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {}

class LoginError extends LoginState {
  String? msg;
  LoginError(
    this.msg,
  );
}
