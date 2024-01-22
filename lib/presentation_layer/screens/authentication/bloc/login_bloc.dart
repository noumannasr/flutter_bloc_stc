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
    on<LoginInitialEvent>((event, emit){
      emit(LoginButtonTapLoading(isLoading: false));
    });
    on<LoginInTheUser>((event, emit) async {
      emit(LoginButtonTapLoading(isLoading: true));

      Map data = {
        "username": event.username,
        "password": event.password
      };
     await _authRepo.loginApi(data).then((value) {

        debugPrint('${value.toJson()} This is in bloc user');
        MySharedPreference.setIsLoggedIn(true);
        emit(LoginButtonTapLoading(isLoading: false));
        emit(LoginLoaded(userModel: value));

        // Utils.flushBarErrorMessage(
        //     "Login Successfully", context, AppColors.greenColor, 'Success');
        // Navigator.pushNamedAndRemoveUntil(
        //     context, RoutesName.products, (route) => false);
      }).onError((error, stackTrace) {
       emit(LoginButtonTapLoading(isLoading: false));
       emit(LoginError(message: error.toString()));
      });

      // TODO: implement event handler
    });
  }
}


// import 'dart:async';
// import 'dart:developer';
//
// import 'package:bloc/bloc.dart';
// import 'package:bloc_fake_store_api/core/constants/app_configs.dart';
// import 'package:bloc_fake_store_api/core/services/network_service.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
//
// part 'login_event.dart';
//
// part 'login_state.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final networkService = NetworkService();
//
//   LoginBloc() : super(LoginState.initial()) {
//     on<LoginTogglePasswordVisibilityEvent>((event, emit) {
//       emit(state.copyWith(isShowPassword: !state.isShowPassword));
//     });
//
//     on<LoginButtonEvent>((event, emit) async {
//       emit(state.copyWith(isLoading: true));
//
//       String url = AppConfigs.signInUrl;
//
//       final data = {
//         "username": event.email,
//         "password": event.password,
//       };
//
//       await networkService.getPostApiResponse(url, data).then((value) {
//         debugPrint("response $value");
//         emit(state.copyWith(isLoggedIn: true, isLoading: false));
//
//       }).catchError((e) {
//         emit(state.copyWith(isLoading: false, errorMsg: e.toString()));
//
//       });
//     });
//   }
// }