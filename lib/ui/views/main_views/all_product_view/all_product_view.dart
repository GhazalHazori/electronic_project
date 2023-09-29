import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:flutter_application_1/ui/views/main_views/all_product_view/all_product_view_controller.dart';
import 'package:flutter_application_1/ui/views/product_datials_view/product_datails_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AllProductView extends StatefulWidget {
  const AllProductView({
    super.key,
  });

  @override
  State<AllProductView> createState() => _AllProductViewState();
}

class _AllProductViewState extends State<AllProductView> {
  AllProductController controller = Get.put(AllProductController());
  @override
  void initState() {
    controller.filteredProductsList = controller.productList;

    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        20.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child: Text(
            "All Products",
            style: TextStyle(
                color: AppColors.blacktext,
                fontSize: screenWidth(20),
                fontWeight: FontWeight.bold),
          ),
        ),
        15.ph,
        Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(50)),
            child: TextFormField(
              controller: controller.searchController,
              onChanged: (query) {
                controller.updateSearchQuery(query);
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                  fillColor: AppColors.greytextcolor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  prefixIcon: Icon(Icons.search),
                  hintText: "  Search ...",
                  hintStyle:
                      TextStyle(color: AppColors.greycolor.withOpacity(0.5))),
            )),
        20.ph,
        Obx(() {
          return controller.isProductLoading
              ? SpinKitCircle(
                  color: AppColors.bluecolor,
                )
              : SizedBox(
                  height: screenHeight(1),
                  width: screenWidth(10),
                  child: controller.productList.isEmpty
                      ? Text('no Product')
                      : GridView.builder(
                          itemCount: controller.filteredProductsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 60),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () async {
                                await Get.to(ProductDatailsView(
                                    model: controller
                                        .filteredProductsList[index]));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth(20),
                                    vertical: screenWidth(600)),
                                child: Container(
                                  width: screenWidth(10),
                                  height: screenHeight(1),
                                  decoration: BoxDecoration(
                                      color: AppColors.whitecolor,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          width: 2,
                                          color: AppColors.greycolor)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          screenWidth(10).pw,
                                          Stack(
                                            alignment:
                                                AlignmentDirectional.center,
                                            children: [
                                              Container(
                                                  width: 100,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.greycolor
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(4),
                                                            topRight:
                                                                Radius.circular(
                                                                    4)),
                                                  )),
                                              RatingBar.builder(
                                                  direction: Axis.horizontal,
                                                  itemCount: 5,
                                                  itemSize: 20,
                                                  initialRating: controller
                                                      .filteredProductsList[
                                                          index]
                                                      .rating!
                                                      .rate!,
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                        Icons.star,
                                                        color:
                                                            AppColors.bluecolor,
                                                      ),
                                                  onRatingUpdate: (rating) {})
                                            ],
                                          )
                                        ],
                                      ),
                                      CachedNetworkImage(
                                        width: screenWidth(8),
                                        height: screenHeight(7),
                                        imageUrl: controller
                                                .filteredProductsList[index]
                                                .image ??
                                            '',
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                      Text(
                                        controller.filteredProductsList[index]
                                                .title ??
                                            '',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: screenWidth(50)),
                                      ),
                                      Row(children: [
                                        Text(
                                          "Price:",
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: AppColors.bluecolor),
                                        ),
                                        Text(
                                          '${controller.filteredProductsList[index].price}',
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: AppColors.blacktext),
                                        ),
                                      ])
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }));
        })
      ]),
    ));
  }
}
