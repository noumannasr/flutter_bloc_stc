

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_weather/data_layer/dataProviders/app_exception/app_exceptions.dart';
import 'package:flutter_bloc_weather/data_layer/dataProviders/network/baseApiService.dart';

class NetworkApiService extends BaseApiService {

  @override
  Future get(String url) async {
    dynamic responseJson;
    final dio = Dio();

    try {
      final response = await dio.get(url);
      responseJson = returnResponseGet(response);
    }
    on SocketException {
      throw FetchDataException('No Internet Exception ');
    }
    return responseJson;
  }

  @override
  Future post(String url, data) async {
    dynamic responseJson;
    final dio = Dio();

    try {
      final response = await dio.post(url,data: data);
      responseJson = returnResponseGet(response);
    }
    on SocketException {
      throw FetchDataException('No Internet Exception ');
    }
    return responseJson;
  }


  dynamic returnResponseGet(Response<dynamic> response) async {

    switch(response.statusCode) {
      case 200:
        return response.data;
      case 400 :
        throw BadRequestException(response.statusMessage);
      case 401 :
        throw BadRequestException(response.statusMessage);
      case 404 :
        throw BadRequestException(response.statusMessage);
      case 500 :
        throw BadRequestException(response.statusMessage);
      default:
        throw FetchDataException('Error occured while communicating with server ${response.statusCode.toString()}');
    }

  }


}