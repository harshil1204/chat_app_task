part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUp extends AuthEvent {
  final String email, password, username;
  SignUp(this.email, this.password, this.username);
}

class SignIn extends AuthEvent {
  final String email, password;
  SignIn(this.email, this.password);
}

class CheckUserLoggedIn extends AuthEvent {}

class Logout extends AuthEvent {}
