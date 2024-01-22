import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather/business_layer/utils/routes/routes_name.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/authentication/login_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/detail/product_detail_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/home_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/products/product_list_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/splash/splash_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/timerTest/count_down_timer_test.dart';
import 'package:flutter_bloc_weather/textFieldFile.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      case RoutesName.products:
        return MaterialPageRoute(builder: (BuildContext context) => const ProductListView());
      case RoutesName.product_detail:
        int id = settings.arguments as int;
        return MaterialPageRoute(
            builder: (BuildContext context) => ProductDetailView(
                  productId: id,
                ));

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const Center(
                  child: Text('No Route Defined'),
                ));
    }
  }
}
