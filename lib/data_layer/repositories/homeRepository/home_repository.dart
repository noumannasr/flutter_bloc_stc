
// import 'dart:convert';
// import 'dart:developer';

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc_weather/business_layer/constants/app_strings.dart';
import 'package:flutter_bloc_weather/data_layer/dataProviders/network/baseApiService.dart';
import 'package:flutter_bloc_weather/data_layer/dataProviders/network/networkApiService.dart';
import 'package:flutter_bloc_weather/data_layer/model/product_model.dart';

class HomeRepository {

  final BaseApiService _apiService = NetworkApiService();

 Future<List<ProductModel>> getDataFromApi() async {
    List<ProductModel> products = [];

     try {
      await _apiService.get(AppUrls.productsEndPoint).then((value) {
        for(var item in value) {
          products.add(ProductModel.fromJson(item));
        }
        log(products.length.toString());
        return products;
      });
      return products;
     }
    catch (e) {
      throw e.toString();
    }
  }




}