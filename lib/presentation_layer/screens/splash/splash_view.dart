import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather/business_layer/constants/colors.dart';
import 'package:flutter_bloc_weather/business_layer/constants/components/app_text.dart';
import 'package:flutter_bloc_weather/business_layer/utils/routes/routes_name.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/authentication/login_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/products/product_list_view.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/splash/splashBloc/splash_bloc.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if(state is SplashLoaded) {
            if(state.isLoggedIn) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutesName.products, (route) => false);
            } else {
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutesName.login, (route) => false);
            }

          }
        },
        builder: (context, state) {
           if(state is SplashInitial) {
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        AppColors.blueColor,
                        AppColors.lightBlueColor,
                      ],
                      stops: [
                        0.0,
                        1.0
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      tileMode: TileMode.repeated)),
              width: size.width,
              height: size.height,
              child:  SizedBox(
                  width: size.width * 0.5,
                  child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text(
                          AppText.stc_health,
                          style: TextStyle(
                              fontSize: TextStylesData.headingLargeFontSize,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ))),
            );
           }
           else{
             return const Center(child: CircularProgressIndicator());
           }


        },
      ),
    );
  }
}
