import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/model/apis/product_model.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:flutter_application_1/ui/views/product_datials_view/product_datails_view_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDatailsView extends StatefulWidget {
  final ProductModel model;
  const ProductDatailsView({super.key, required this.model});

  @override
  State<ProductDatailsView> createState() => _ProductDatailsViewState();
}

class _ProductDatailsViewState extends State<ProductDatailsView> {
  late ProductDatailsController controller;
  @override
  void initState() {
    controller = Get.put(ProductDatailsController(widget.model));
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          screenWidth(15).ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
            child: Column(
              children: [
                Text(widget.model.title ?? ''),
                CachedNetworkImage(
                  width: screenWidth(4),
                  height: screenHeight(4),
                  imageUrl: widget.model.image ?? '',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                Row(
                  children: [
                    Text(
                      "Desecription:",
                      style: TextStyle(
                          color: AppColors.bluecolor,
                          fontSize: screenWidth(15)),
                    ),
                    screenWidth(10).pw,
                    RatingBar.builder(
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemSize: 20,
                        initialRating: widget.model.rating!.rate!,
                        itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: AppColors.bluecolor,
                            ),
                        onRatingUpdate: (rating) {})
                  ],
                ),
                screenWidth(15).ph,
                Text(widget.model.description ?? ''),
                screenWidth(20).ph,
                Row(children: [
                  20.ph,
                  Text(
                    "Category:",
                    style: TextStyle(
                        color: AppColors.bluecolor, fontSize: screenWidth(15)),
                  ),
                  Text(widget.model.category ?? ''),
                ]),
                Row(
                  children: [
                    Text(
                      "Price:",
                      style: TextStyle(
                          color: AppColors.bluecolor,
                          fontSize: screenWidth(15)),
                    ),
                    Text('${widget.model.price ?? '1000'}'),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                width: screenWidth(1),
                height: screenHeight(7),
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
              ),
              Obx(() {
                return Row(
                  children: [
                    10.pw,
                    ElevatedButton(
                        onPressed: () {
                          controller.addToCart();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluecolor,
                            shape: StadiumBorder()),
                        child: Text(
                          "Add To Cart ",
                          style: TextStyle(
                              color: AppColors.whitecolor,
                              fontSize: screenWidth(15)),
                        )),
                    30.pw,
                    ElevatedButton(
                        onPressed: () {
                          controller.changecount(true);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluecolor,
                            shape: CircleBorder()),
                        child: Text(
                          '+',
                          style: TextStyle(
                              fontSize: screenWidth(15),
                              color: AppColors.whitecolor),
                        )),
                    Text(
                      controller.count.value.toString(),
                      style: TextStyle(
                          fontSize: screenWidth(15),
                          color: AppColors.blacktext),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.changecount(false);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluecolor,
                            shape: CircleBorder()),
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontSize: screenWidth(15),
                              color: AppColors.whitecolor),
                        ))
                  ],
                );
              })
            ],
          )
        ],
      ),
    ));
  }
}
