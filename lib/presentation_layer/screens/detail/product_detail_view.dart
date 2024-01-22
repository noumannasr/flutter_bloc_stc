import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_weather/business_layer/constants/colors.dart';
import 'package:flutter_bloc_weather/business_layer/constants/components/app_text.dart';
import 'package:flutter_bloc_weather/business_layer/constants/components/round_button.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/detail/detailBloc/detail_bloc.dart';
import 'package:flutter_bloc_weather/presentation_layer/screens/detail/is_expanded_bloc.dart';

class ProductDetailView extends StatefulWidget {
  final int productId;

  const ProductDetailView({super.key, required this.productId});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  // final ProductDetailViewModel productDetailViewModel =
  // ProductDetailViewModel();

  @override
  void initState() {
    // TODO: implement initState
    // productDetailViewModel.setExpandSheet(false);
    // productDetailViewModel.getProductDetail(context, widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is DetailLoadingState) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
              backgroundColor: AppColors.whiteColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Container(
                padding: const EdgeInsets.only(
                    left: 0, top: 4, bottom: 4, right: 0),
                width: size.width,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop(true);
                      },
                      child: AbsorbPointer(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset:
                                Offset(0, 2), // Offset of the shadow
                                blurRadius: 2, // Spread of the shadow
                                spreadRadius:
                                0, // Amount of spreading, negative values can be used to shrink the shadow
                              ),
                            ],
                          ),
                          width: 35,
                          height: 35,
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.blackColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2), // Offset of the shadow
                            blurRadius: 2, // Spread of the shadow
                            spreadRadius:
                            0, // Amount of spreading, negative values can be used to shrink the shadow
                          ),
                        ],
                      ),
                      width: 35,
                      height: 35,
                      child: const Icon(
                        Icons.more_vert,
                        color: AppColors.blackColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.lightBlueColor,
                  strokeWidth: 2,
                )),
          );
        }
        if (state is DetailLoadedState) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            bottomSheet: BlocBuilder<IsExpandedBloc, IsExpandedState>(
              builder: (context, stateEx) {

                  if(stateEx is ExpandedState) {
                    return SizedBox(
                      height: stateEx.isExpanded ? size.height*0.5 : size.height * 0.38,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 8, bottom: 0),
                              child:  Text('${state.product.price}  AED',
                                style: const TextStyle(
                                    color: AppColors.darkBlueColor,
                                    fontSize: TextStylesData.titleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            child: Container(
                                decoration: const BoxDecoration(
                                    color: AppColors.lightGreyColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0))),
                                child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          // productDetailViewModel.expandSheet ? productDetailViewModel.setExpandSheet(false)
                                          //     : productDetailViewModel
                                          //     .setExpandSheet(true);
                                        },
                                        icon: const Icon(
                                          // productDetailViewModel.expandSheet
                                          //     ? Icons.keyboard_arrow_down
                                          //     :
                                          Icons.keyboard_arrow_up,
                                          color: AppColors.lightBlueColor,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15, right: 15),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            width: size.width,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: AppColors.whiteColor,
                                                    borderRadius:
                                                    BorderRadius.circular(20),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        offset: Offset(0,
                                                            2), // Offset of the shadow
                                                        blurRadius:
                                                        2, // Spread of the shadow
                                                        spreadRadius:
                                                        0, // Amount of spreading, negative values can be used to shrink the shadow
                                                      ),
                                                    ],
                                                  ),
                                                  width: 50,
                                                  height: 50,
                                                  child: const Icon(
                                                    Icons.ios_share_outlined,
                                                    color: AppColors.lightBlueColor,
                                                    size: 20,
                                                  ),
                                                ),
                                                RoundButton(
                                                  round: 30.0,
                                                  width: size.width * 0.68,
                                                  color: AppColors.lightBlueColor,
                                                  title: AppText.orderNowText,
                                                  onPress: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                  alignment: Alignment.centerLeft,
                                                  child: const Text(
                                                    "Description",

                                                    style: TextStyle(
                                                        color: AppColors.greyColor,

                                                        fontSize: TextStylesData
                                                            .extraSmallFontSize),
                                                  )),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  context.read<IsExpandedBloc>().add(
                                                      ExpandedEvent(isExpanded: stateEx.isExpanded));
                                                },
                                                child: Container(
                                                    alignment: Alignment.centerLeft,
                                                    child: Text(
                                                      state.product.description
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: AppColors.greyColor,
                                                          fontSize: TextStylesData
                                                              .extraSmallFontSize),
                                                      maxLines: stateEx.isExpanded ? 10 :
                                                      //expandSheet.value ? 100 :
                                                      3,
                                                      overflow: TextOverflow.ellipsis,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                            ],
                                          ),

                                          Visibility(
                                            // visible:
                                            // productDetailViewModel.expandSheet,
                                            child: Container(
                                              //  height: size.height*0.1,
                                              width: size.width,
                                              decoration: const BoxDecoration(
                                                color: AppColors.whiteColor,
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      alignment: Alignment.centerLeft,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets.only(left: 5, right: 5, top: 4),
                                                        child: Text(
                                                          "Review (${state.product.rating!.count.toString()})",
                                                          style: const TextStyle(
                                                              color: AppColors.greyColor,
                                                              fontSize: TextStylesData.extraSmallFontSize),
                                                        ),
                                                      )),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Padding(padding: const EdgeInsets.only(left: 5, right: 5, top: 4),
                                                        child: Container(
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                                state.product.rating!.rate.toString(),
                                                                style: const TextStyle(
                                                                    color: AppColors.blackColor,
                                                                    fontSize: TextStylesData.titleFontSize))),
                                                      ),
                                                    ],
                                                  ),

                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.01,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Text('');

              },
            ),
            appBar: AppBar(
              backgroundColor: AppColors.whiteColor,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Container(
                padding: const EdgeInsets.only(
                    left: 0, top: 4, bottom: 4, right: 0),
                width: size.width,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset:
                              Offset(0, 2), // Offset of the shadow
                              blurRadius: 2, // Spread of the shadow
                              spreadRadius:
                              0, // Amount of spreading, negative values can be used to shrink the shadow
                            ),
                          ],
                        ),
                        width: 35,
                        height: 35,
                        child: const Icon(
                          Icons.arrow_back,
                          color: AppColors.blackColor,
                          size: 20,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2), // Offset of the shadow
                            blurRadius: 2, // Spread of the shadow
                            spreadRadius:
                            0, // Amount of spreading, negative values can be used to shrink the shadow
                          ),
                        ],
                      ),
                      width: 35,
                      height: 35,
                      child: const Icon(
                        Icons.more_vert,
                        color: AppColors.blackColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: size.height * 0.5,
                  width: size.width,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // color: AppColors.whiteColor,
                        ),
                        //color: AppColors.greyColor.withOpacity(0.3),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: CachedNetworkImage(
                              height: size.height,
                              width: size.width,
                              fit: BoxFit.scaleDown,
                              imageUrl: state.product.image
                                  .toString(),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          SizedBox(
                            width: size.width,
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 15, right: 15, top: 0, bottom: 0),
                              child: Text(
                                'Details',
                                style: TextStyle(
                                    color: AppColors.darkBlueColor,
                                    fontSize: TextStylesData.titleFontSize,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        if (state is DetailErrorState) {
          return Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.whiteColor,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Container(
                  padding: const EdgeInsets.only(
                      left: 0, top: 4, bottom: 4, right: 0),
                  width: size.width,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset:
                                Offset(0, 2), // Offset of the shadow
                                blurRadius: 2, // Spread of the shadow
                                spreadRadius:
                                0, // Amount of spreading, negative values can be used to shrink the shadow
                              ),
                            ],
                          ),
                          width: 35,
                          height: 35,
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.blackColor,
                            size: 20,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 2), // Offset of the shadow
                              blurRadius: 2, // Spread of the shadow
                              spreadRadius:
                              0, // Amount of spreading, negative values can be used to shrink the shadow
                            ),
                          ],
                        ),
                        width: 35,
                        height: 35,
                        child: const Icon(
                          Icons.more_vert,
                          color: AppColors.blackColor,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Center(
                  child: Text(state.error.toString())));
        }
        else {
          return const Text('No Data Found');
        }
      },
    );
  }
}
