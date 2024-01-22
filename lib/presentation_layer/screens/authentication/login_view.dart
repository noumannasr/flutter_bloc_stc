import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather/business_layer/constants/colors.dart';
import 'package:flutter_bloc_weather/business_layer/constants/components/app_text.dart';
import 'package:flutter_bloc_weather/business_layer/constants/components/round_button.dart';
import 'package:flutter_bloc_weather/business_layer/utils/routes/routes_name.dart';
import 'package:flutter_bloc_weather/business_layer/utils/utils.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/authentication/bloc/login_bloc.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/products/product_list_view.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier obsecurePassword = ValueNotifier(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginBloc, LoginState1>(
        listener: (context, state) {
          if (state is LoginInitial) {
            context.read<LoginBloc>().add(LoginInitialEvent());
          }
          if (state is LoginError) {
            Utils.flushBarErrorMessage(state.message.toString(), context, AppColors.darkRedColor, 'Error');
          }
          if (state is LoginLoaded) {
            Utils.flushBarErrorMessage("Login Successfully", context, AppColors.greenColor, 'Success');
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.products, (route) => false);
          }
          if (state is LoginError) {
            Utils.flushBarErrorMessage(state.message.toString(), context, AppColors.darkRedColor, 'Error');
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoginInitial || state is LoginError) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.4,
                    width: size.width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                      AppColors.blueColor,
                      AppColors.lightBlueColor,
                    ], stops: [
                      0.0,
                      1.0
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight, tileMode: TileMode.repeated)),
                    child: Column(
                      children: [
                        SizedBox(
                            height: size.height * 0.32,
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
                        SizedBox(
                            height: size.height * 0.08,
                            width: size.width,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                AppText.login,
                                style: TextStyle(
                                    fontSize: TextStylesData.headingSmallFontSize,
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                        child: TextFormField(
                          controller: _emailAddressController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            // if(EmailValidator.validate(value)) {
                            //   setState(() {
                            //     isValid = true;
                            //   });
                            // } else {
                            //   setState(() {
                            //     isValid = false;
                            //   });
                            // }
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            fillColor: Colors.grey,
                            labelText: 'Email',
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  //  obsecurePassword.value = !obsecurePassword.value;
                                },
                                child: const Icon(
                                  Icons.verified_outlined,
                                  color: AppColors.greenColor,
                                  size: 20,
                                )),
                            labelStyle: const TextStyle(
                              color: AppColors.greyColor,
                              fontSize: TextStylesData.smallFontSize,
                              fontFamily: "verdana_regular",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      ValueListenableBuilder(
                          valueListenable: obsecurePassword,
                          builder: (context, value, child) {
                            return Container(
                              margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
                              child: TextFormField(
                                autofocus: true,
                                keyboardType: TextInputType.text,
                                controller: _passwordController,
                                obscureText: obsecurePassword.value ? true : false,
                                textInputAction: TextInputAction.done,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        obsecurePassword.value = !obsecurePassword.value;
                                      },
                                      child: Icon(
                                        obsecurePassword.value ? Icons.visibility_off_outlined : Icons.visibility,
                                        size: 20,
                                        color: AppColors.greyColor.withOpacity(0.5),
                                      )),
                                  fillColor: Colors.grey,
                                  labelText: 'Password',
                                  hintText: '************',
                                  labelStyle: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: TextStylesData.smallFontSize,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      // if (state is LoginButtonTapLoading)
                      //  state.isLoading ? CircularProgressIndicator(color: Colors.blue,) :
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: RoundButton(
                          width: size.width,
                          //isLoading: authViewModel.loading,
                          round: 30.0,
                          color: AppColors.lightBlueColor,
                          title: AppText.continueText,
                          onPress: () {
                            // Navigator.pushNamed(context, RoutesName.products);

                            if (_emailAddressController.text.isEmpty) {
                              Utils.flushBarErrorMessage('Enter email ', context, AppColors.darkRedColor, 'Error');
                            } else if (_passwordController.text.isEmpty) {
                              Utils.flushBarErrorMessage('Enter password ', context, AppColors.darkRedColor, 'Error');
                            } else if (_passwordController.text.length < 6) {
                              Utils.flushBarErrorMessage(
                                  'Please enter 6 digits password ', context, AppColors.darkRedColor, 'Error');
                            } else {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginInTheUser(
                                  username: _emailAddressController.text,
                                  password: _passwordController.text,
                                ),
                              );
                              //context.read<LoginBloc>().add();
                              // authViewModel.loginApi(_emailAddressController.text,
                              //     _passwordController.text, context);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppText.needHelp,
                              style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: TextStylesData.smallFontSize,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Loading..'),
            ); // Initial login screen
          }
        },
      ),
    );
  }
}

// import 'package:bloc_fake_store_api/core/constants/colors.dart';
// import 'package:bloc_fake_store_api/core/constants/text_styles.dart';
// import 'package:bloc_fake_store_api/core/utils/screen_utilities.dart';
// import 'package:bloc_fake_store_api/core/utils/utils.dart';
// import 'package:bloc_fake_store_api/core/utils/validators.dart';
// import 'package:bloc_fake_store_api/ui/screens/all_products/all_products_screen.dart';
// import 'package:bloc_fake_store_api/ui/screens/login/bloc/login_bloc.dart';
// import 'package:bloc_fake_store_api/ui/widgets/custom_button.dart';
// import 'package:bloc_fake_store_api/ui/widgets/custom_textfield.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// class LoginScreen extends StatefulWidget {
//   static const String routeName = '/login_screen';
//
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final formKey = GlobalKey<FormState>();
//
//   final emailC = TextEditingController();
//   final passwordC = TextEditingController();
//
//   @override
//   void dispose() {
//     emailC.dispose();
//     passwordC.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => LoginBloc(),
//       child: GestureDetector(
//         onTap: () {
//           if (FocusScope.of(context).hasFocus) {
//             FocusScope.of(context).unfocus();
//           }
//         },
//         child: Scaffold(
//           body: BlocConsumer<LoginBloc, LoginState>(
//             listener: (context, state) {
//               // TODO: implement listener
//
//               if (state.isLoggedIn) {
//                 Navigator.pushNamed(context, AllProductsScreen.routeName);
//               }
//               if (state.errorMsg.isNotEmpty) {
//                 Utils.showFlushBar(context, "Error", state.errorMsg);
//               }
//             },
//             builder: (context, state) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     ///50% Container with center text and bottom left
//                     Container(
//                       height: 50.h,
//                       width: 100.w,
//                       decoration: const BoxDecoration(
//                           gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
//                             AppColors.colorPrimaryDark,
//                             AppColors.colorPrimary,
//                           ])),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const SizedBox(),
//                           Text(
//                             'STC\nHealth',
//                             textAlign: TextAlign.center,
//                             style: normalTextStyle.copyWith(
//                               fontSize: 36.px,
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(bottom: 28.0.sp, left: 20.sp),
//                             child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   'Log In',
//                                   style: normalTextStyle.copyWith(
//                                     fontSize: 34.px,
//                                   ),
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                     ///Text Fields
//                     Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 25.0.sp),
//                         child: Form(
//                           key: formKey,
//                           child: Column(
//                             children: [
//                               kHeight(3.h),
//                               CustomTextField(
//                                 controller: emailC,
//                                 hintText: 'Email',
//                                 labelText: 'Email',
//                                 validator: validateNormalField,
//                               ),
//                               kHeight(3.h),
//
//                               CustomTextField(
//                                 controller: passwordC,
//                                 hintText: 'Password',
//                                 labelText: 'Password',
//                                 suffixIcon: GestureDetector(
//                                   onTap: () {
//                                     print('event added');
//
//                                     context.read<LoginBloc>().add(LoginTogglePasswordVisibilityEvent());
//                                   },
//                                   child: Icon(
//                                     state.isShowPassword ? Icons.visibility_off : Icons.visibility,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                                 obscureText: state.isShowPassword ? true : false,
//                                 validator: validatePasswordField,
//                               ),
//
//                               kHeight(4.h),
//
//                               ///Continue Button
//
//                               state.isLoading
//                                   ? const Center(
//                                 child: CircularProgressIndicator(),
//                               )
//                                   : CustomButton(
//                                 onTap: () {
//                                   // vm.handleLoginTap(context);
//                                   context.read<LoginBloc>().add(LoginButtonEvent(
//                                     email: emailC.text,
//                                     password: passwordC.text,
//                                   ));
//                                 },
//                                 // isLoading: vm.isLoading,
//                                 text: 'Continue',
//                               ),
//
//                               kHeight(2.h),
//
//                               ///Need Help Text
//                               Text('Need Help?', style: normalTextStyle2)
//                             ],
//                           ),
//                         ))
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
