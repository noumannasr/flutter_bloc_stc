import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_weather/business_layer/constants/colors.dart';
import 'package:flutter_bloc_weather/data_layer/model/product_model.dart';

class ProductItem extends StatefulWidget {
  final ProductModel product;
  final VoidCallback onTap;
  const ProductItem({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.25,
              width: size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.whiteColor,
                      ),
                      //color: AppColors.greyColor.withOpacity(0.3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CachedNetworkImage(
                            height: size.height * 0.25,
                            width: size.width,
                            fit: BoxFit.scaleDown,
                            imageUrl: widget.product.image.toString(),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: size.height * 0.02,
                    left: size.width * 0.05,
                    child: Container(
                      padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4, right: 8),
                      width: size.width * 0.88,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.product.price}  AED',
                            style: const TextStyle(color: AppColors.darkBlueColor, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          //RatingItem(rate: widget.product.rating!.rate,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
              width: size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.product.title.toString(),
                style: const TextStyle(color: AppColors.darkBlueColor, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
              width: size.width,
              alignment: Alignment.centerLeft,
              child: Text(
                widget.product.description.toString(),
                style: const TextStyle(color: AppColors.blackColor, fontSize: 12, fontWeight: FontWeight.w300),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Divider(
                height: 1,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
