part of 'login_bloc.dart';

@immutable
abstract class LoginState1 {}


class LoginInitial extends LoginState1 {}
class LoginLoading extends LoginState1 {}

class LoginLoaded extends LoginState1 {
  final UserModel userModel;

  LoginLoaded({required this.userModel});
}

class LoginError extends LoginState1 {
  final String message;

  LoginError({required this.message});

}
