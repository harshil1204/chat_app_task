part of 'auth_bloc.dart';

abstract class AuthState {}
class AuthInitial extends AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}

class AuthLoggedOut extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
