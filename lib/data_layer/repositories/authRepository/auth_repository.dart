import 'package:flutter_bloc_weather/business_layer/constants/app_strings.dart';
import 'package:flutter_bloc_weather/data_layer/dataProviders/network/baseApiService.dart';
import 'package:flutter_bloc_weather/data_layer/dataProviders/network/networkApiService.dart';
import 'package:flutter_bloc_weather/data_layer/model/user_model.dart';

class AuthRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<UserModel> loginApi(dynamic data) async {
    UserModel? userModel;
    try {

          await _apiService.post(AppUrls.loginEndPoint, data).then((value) {
            userModel = UserModel.fromJson(value);
            return userModel;
          });
      return userModel!;
    } catch (e) {
      throw e.toString();
    }
  }
}
