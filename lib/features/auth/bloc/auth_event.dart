part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;

  SignUpRequested(
      {required this.email, required this.password, required this.name});
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  LoginRequested({required this.email, required this.password});
}

class LogoutRequested extends AuthEvent {}

class ResetPasswordRequested extends AuthEvent {
  final String email;

  ResetPasswordRequested({required this.email});
}
