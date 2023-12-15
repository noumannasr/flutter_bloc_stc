part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInTheUser extends LoginEvent {
  final String username;
  final String password;

  LoginInTheUser({required this.username, required this.password});

}