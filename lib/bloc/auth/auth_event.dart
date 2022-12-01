part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class IsHasLogin extends AuthEvent {}

class Login extends AuthEvent {
  final String nim;
  final String password;
  Login({
    required this.nim,
    required this.password,
  });
}
