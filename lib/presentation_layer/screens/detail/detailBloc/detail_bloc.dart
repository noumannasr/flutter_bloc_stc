import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_weather/data_layer/model/product_detail_model.dart';
import 'package:flutter_bloc_weather/data_layer/model/product_model.dart';
import 'package:flutter_bloc_weather/data_layer/repositories/productDetailRepository/product_detail_repository.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final _myProductDetail = ProductDetailRepository();

  DetailBloc() : super(DetailLoadingState()) {
    on<GetLoadedData>((event, emit) async {
      emit(DetailLoadingState());
      await _myProductDetail.getDataFromApi(event.model.id!).then((product) {
        print('we return back to bloc');
        emit(DetailLoadedState(product: product));
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error.toString());
          emit(DetailErrorState(error.toString()));
        }
      });
    });



  }
}
