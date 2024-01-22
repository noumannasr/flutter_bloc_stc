
// import 'dart:convert';
// import 'dart:developer';

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc_weather/business_layer/constants/app_strings.dart';
import 'package:flutter_bloc_weather/data_layer/dataProviders/network/baseApiService.dart';
import 'package:flutter_bloc_weather/data_layer/dataProviders/network/networkApiService.dart';
import 'package:flutter_bloc_weather/data_layer/model/product_detail_model.dart';
import 'package:flutter_bloc_weather/data_layer/model/product_model.dart';

class ProductDetailRepository {

  final BaseApiService _apiService = NetworkApiService();

  Future<ProductDetailModel> getDataFromApi(int id) async {
    ProductDetailModel? products ;

    try {
      await _apiService.get(AppUrls.productsEndPoint + '/$id').then((value) {
        products = ProductDetailModel.fromJson(value);

        log(products.toString() + ' We are here');
        return products;
      });
      return products!;
    }
    catch (e) {
      throw e.toString();
    }
  }




}