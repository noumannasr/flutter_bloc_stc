import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather/business_layer/bloc/api_bloc.dart';
import 'package:flutter_bloc_weather/business_layer/constants/colors.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/products/widget/product_item.dart';
import 'package:provider/provider.dart';


class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {


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
        title: Text(
          'Products',
          style: TextStyle(
              color: AppColors.darkBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // userviewModel.remove().then((value) {
                //   Navigator.pushNamedAndRemoveUntil(
                //       context, RoutesName.login, (route) => false);
                // });
              },
              icon: Icon(
                Icons.logout,
                color: AppColors.lightBlueColor,
              ))
        ],
      ),
      body:
      Center(child: BlocBuilder<ApiBloc, AppState>(
        builder: (BuildContext context, AppState state) {

        if(state is AppLoadingState) {
          return CircularProgressIndicator(
          );
        }
        if(state is AppLoadedState) {
          return state.productList.isEmpty ?
          Text(state.productList.length.toString() + ' It is empty') : ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: state.productList.length,
                          itemBuilder: (BuildContext context, index) {
                            final productItem =
                            state.productList[index];
                            return ProductItem(
                              product: productItem,
                            );
                          });
        }
        if(state is AppErrorState) {
          return Center(child: Text(state.error.toString()));
        }
        else {
          return Column(
            children: [
              const Text('Something went wrong'),
            ],
          );
        }

      },)),

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
