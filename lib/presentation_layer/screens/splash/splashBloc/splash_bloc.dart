import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather/business_layer/services/my_shared_preference.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<CheckIsLoggedIn>((event, emit) async {
      final check = MySharedPreference.getIsLoggedIn();
      if (check) {
        emit(SplashLoaded(isLoggedIn: true));
      } else {
        await Future.delayed(Duration(seconds: 5)).whenComplete(() {
          emit(SplashLoaded(isLoggedIn: false));
        });
      }
      // TODO: implement event handler
    });
  }
}
