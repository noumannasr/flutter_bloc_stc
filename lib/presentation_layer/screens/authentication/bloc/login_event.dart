part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginInitialEvent extends LoginEvent {
}

class LoginInTheUser extends LoginEvent {
  final String username;
  final String password;

  LoginInTheUser({required this.username, required this.password});

}


// part of 'login_bloc.dart';
//
// abstract class LoginEvent extends Equatable {
//   const LoginEvent();
// }
//
// class LoginTogglePasswordVisibilityEvent extends LoginEvent {
//   @override
//   List<Object?> get props => [];
// }
//
// class LoginButtonEvent extends LoginEvent {
//
//   final String email;
//   final String password;
//
//   const LoginButtonEvent({required this.email, required this.password});
//
//   @override
//   List<Object?> get props => [email, password];
// }
