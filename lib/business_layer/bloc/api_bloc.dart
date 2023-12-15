import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_weather/data_layer/dataProviders/response/api_response.dart';
import 'package:flutter_bloc_weather/data_layer/model/product_model.dart';
import 'package:flutter_bloc_weather/data_layer/repositories/homeRepository/home_repository.dart';
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, AppState> {
  final _myProductRepo = HomeRepository();

  ApiBloc() : super(AppLoadingState()) {
    on<LoadGetData>((event, emit) async {
      emit(AppLoadingState());
      await _myProductRepo.getDataFromApi().then((productList) {
        emit(AppLoadedState(productList: productList));
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error.toString());
          emit(AppErrorState(error.toString()));
        }
      });
    });
  }
}
