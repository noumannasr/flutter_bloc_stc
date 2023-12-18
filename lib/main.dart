import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather/business_layer/bloc/api_bloc.dart';
import 'package:flutter_bloc_weather/business_layer/services/my_shared_preference.dart';
import 'package:flutter_bloc_weather/business_layer/utils/routes/routes.dart';
import 'package:flutter_bloc_weather/business_layer/utils/routes/routes_name.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/authentication/bloc/login_bloc.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/authentication/login_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/detail/detailBloc/detail_bloc.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/home_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/products/product_list_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/splash/splashBloc/splash_bloc.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:  [
        BlocProvider(create: (context) => SplashBloc()..add(CheckIsLoggedIn())),
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => ApiBloc()..add(LoadGetData())),
        BlocProvider(create: (context) => DetailBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoutes,
        home: const LoginView(),
      ),
    );
  }
}


