class LoginEvent {}

class LoadingLogin extends LoginEvent {}

class LoginUser extends LoginEvent {
  final String? codeDriver;
  final String? password;
  LoginUser(
    this.codeDriver,
    this.password,
  );
}
