part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoaded extends SplashState {
  final bool isLoggedIn;

  SplashLoaded({required this.isLoggedIn});
}

