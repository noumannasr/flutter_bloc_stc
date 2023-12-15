import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather/business_layer/services/my_shared_preference.dart';
import 'package:flutter_bloc_weather/business_layer/utils/utils.dart';
import 'package:flutter_bloc_weather/data_layer/model/user_model.dart';
import 'package:flutter_bloc_weather/data_layer/repositories/authRepository/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState1> {
  final _authRepo = AuthRepository();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginBloc() : super(LoginInitial()) {
    on<LoginInTheUser>((event, emit) async {
      emit(LoginLoading());

      Map data = {
        "username": event.username,
        "password": event.password
      };
     await _authRepo.loginApi(data).then((value) {

        print(value.toJson().toString() + ' This is in bloc user');
        MySharedPreference.setIsLoggedIn(true);
        emit(LoginLoaded(userModel: value));

        // Utils.flushBarErrorMessage(
        //     "Login Successfully", context, AppColors.greenColor, 'Success');
        // Navigator.pushNamedAndRemoveUntil(
        //     context, RoutesName.products, (route) => false);
      }).onError((error, stackTrace) {
        emit(LoginError(message: error.toString()));
      });

      // TODO: implement event handler
    });
  }
}
