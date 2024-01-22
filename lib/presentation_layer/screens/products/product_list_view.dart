import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather/business_layer/bloc/api_bloc.dart';
import 'package:flutter_bloc_weather/business_layer/constants/colors.dart';
import 'package:flutter_bloc_weather/business_layer/services/my_shared_preference.dart';
import 'package:flutter_bloc_weather/business_layer/utils/routes/routes_name.dart';
import 'package:flutter_bloc_weather/data_layer/model/product_detail_model.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/authentication/bloc/login_bloc.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/detail/detailBloc/detail_bloc.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/products/widget/product_item.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  LoginBloc service = GetIt.instance.get<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        //elevation: 1,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text(
          'Products',
          style: TextStyle(color: AppColors.darkBlueColor, fontWeight: FontWeight.bold, fontSize: 12),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // print(service..toString() + ' This is the app state');
                print(service.state.toString() + ' This is the app state');

                // MySharedPreference.setIsLoggedIn(false);
                // Navigator.pushNamedAndRemoveUntil(
                //     context, RoutesName.login, (route) => false);
              },
              icon: const Icon(
                Icons.logout,
                color: AppColors.lightBlueColor,
              ))
        ],
      ),
      body: Center(child: BlocBuilder<ApiBloc, AppState>(
        builder: (BuildContext context, AppState state) {
          if (state is AppLoadingState) {
            return const CircularProgressIndicator();
          }
          if (state is AppLoadedState) {
            return state.productList.isEmpty
                ?  Text('${state.productList.length} It is empty')
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.productList.length,
                    itemBuilder: (BuildContext context, index) {
                      final productItem = state.productList[index];
                      return ProductItem(
                        product: productItem,
                        onTap: () {
                          // DetailBloc detailService = GetIt.instance.get<DetailBloc>();
                          context.read<DetailBloc>().add(GetLoadedData(model: productItem));
                          // detailService.add(GetLoadedData(model: productItem));
                          Navigator.pushNamed(context, RoutesName.product_detail, arguments: productItem.id);
                        },
                      );
                    });
          }
          if (state is AppErrorState) {
            return Center(child: Text(state.error.toString()));
          } else {
            return const Column(
              children: [
                 Text('Something went wrong'),
              ],
            );
          }
        },
      )),

      // ChangeNotifierProvider<ProductViewModel>(
      //   create: (BuildContext context) => productViewModel,
      //   child: Consumer<ProductViewModel>(builder: (context, value, _) {
      //     switch (value.productList.status) {
      //       case Status.LOADING:
      //         return Center(
      //             child: CircularProgressIndicator(
      //               color: AppColors.lightBlueColor,
      //               strokeWidth: 2,
      //             ));
      //       case Status.ERROR:
      //         return Center(child: Text(value.productList.message.toString()));
      //       case Status.COMPLETED:
      //         return ListView.builder(
      //             shrinkWrap: true,
      //             scrollDirection: Axis.vertical,
      //             itemCount: productViewModel.productList.data!.length,
      //             itemBuilder: (BuildContext context, index) {
      //               final productItem =
      //               productViewModel.productList.data![index];
      //               return ProductItem(
      //                 product: productItem,
      //               );
      //             });
      //       default:
      //     }
      //     return Container();
      //   }),
      // ),
    );
  }
}
