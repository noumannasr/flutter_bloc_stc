part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoaded extends SplashState {
  final bool isLoggedIn;
 // git config --global user.email "noumankipsian@gmail.com"
  // git config --global user.name "noumannasr"
  SplashLoaded({required this.isLoggedIn});
}

