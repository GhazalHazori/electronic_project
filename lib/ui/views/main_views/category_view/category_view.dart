import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/repositories/category_repository.dart';
import 'package:flutter_application_1/core/data/repositories/product_repository.dart';
import 'package:flutter_application_1/core/enums/message_type.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_container.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:flutter_application_1/ui/views/main_views/all_product_view/all_product_view.dart';
import 'package:flutter_application_1/ui/views/main_views/category_view/category_view_controller.dart';
import 'package:flutter_application_1/ui/views/product_datials_view/product_datails_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryController controller = Get.put(CategoryController());
  // List<String> categoryList = <String>[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Text(
              "Category",
              style: TextStyle(
                  color: AppColors.blacktext, fontSize: screenWidth(10)),
            ),
            10.ph,

            SizedBox(
              height: 50,
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(children: [
                      // Container(
                      //     width: 150,
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(5),
                      //       color: AppColors.bluecolor,
                      //     ),
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(vertical: 10),
                      //       child: InkWell(
                      //         onTap: () {
                      //           Get.to(AllProductView());
                      //         },
                      //         child: Text(
                      //           "All",
                      //           textAlign: TextAlign.center,
                      //           style: TextStyle(
                      //               color: AppColors.whitecolor,
                      //               fontSize: screenWidth(20)),
                      //         ),
                      //       ),
                      //     )),
                      Obx(() {
                        return SizedBox(
                            height: 50,
                            child: controller.categoryList.isEmpty
                                ? Text("no Category")
                                : ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: controller.categoryList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              customContainer(
                                                onTap: () {},
                                                text: controller
                                                    .categoryList[index],
                                                index: index,
                                              )
                                            ]),
                                      );
                                    }));
                      }),
                    ]),
                  ]),
            ),
            20.ph,
            Text(
              "Products",
              style: TextStyle(
                  color: AppColors.blacktext, fontSize: screenWidth(10)),
            ),
            10.ph,

            Obx(() {
              return controller.isProductLoading
                  ? SpinKitCircle(
                      color: AppColors.bluecolor,
                    )
                  : SizedBox(
                      height: screenHeight(1),
                      child: controller.productList.isEmpty
                          ? Text('no Product')
                          : GridView.builder(
                              itemCount: controller.productList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 60,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth(30),
                                      vertical: screenWidth(600)),
                                  child: Container(
                                    width: screenWidth(1),
                                    height: screenHeight(1),
                                    decoration: BoxDecoration(
                                        color: AppColors.whitecolor,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            width: 2,
                                            color: AppColors.greycolor)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            screenWidth(8.8).pw,
                                            Stack(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              children: [
                                                Container(
                                                    width: 100,
                                                    height: 20,
                                                    decoration: BoxDecoration(
                                                      color: AppColors.greycolor
                                                          .withOpacity(0.5),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(4),
                                                              topRight: Radius
                                                                  .circular(4)),
                                                    )),
                                                RatingBar.builder(
                                                    direction: Axis.horizontal,
                                                    itemCount: 5,
                                                    itemSize: 20,
                                                    initialRating: controller
                                                        .productList[index]
                                                        .rating!
                                                        .rate!,
                                                    itemBuilder: (context, _) =>
                                                        Icon(
                                                          Icons.star,
                                                          color: AppColors
                                                              .bluecolor,
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
                                                  .productList[index].image ??
                                              '',
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                        Text(
                                          controller.productList[index].title ??
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
                                            '${controller.productList[index].price}',
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: AppColors.blacktext),
                                          ),
                                        ])
                                      ],
                                    ),
                                  ),
                                );
                              }));
            })
            // FutureBuilder(
            //     future: CategoryRepository().getAll(),
            //     builder: (context, snapshot) {
            //       if (snapshot.data != null) {
            //         snapshot.data!.fold((l) {
            //           CustomToast.showMessage(
            //               message: l, messagetype: MessagType.REJECTED);
            //         }, (r) {
            //           categoryList.clear();
            //           categoryList.addAll(r);
            //         });
            //       }
            //       return snapshot.data == null
            //           ? SpinKitCircle(
            //               color: AppColors.maingreen,
            //             )
            //           : ListView.builder(
            //               physics: BouncingScrollPhysics(),
            //               shrinkWrap: true,
            //               itemCount: categoryList.length,
            //               itemBuilder: (BuildContext context, index) {
            //                 return Container(
            //                     margin: const EdgeInsets.all(15.0),
            //                     padding: const EdgeInsets.all(3.0),
            //                     decoration: BoxDecoration(
            //                         color: AppColors.whitecolor,
            //                         border:
            //                             Border.all(color: AppColors.greycolor),
            //                         borderRadius: BorderRadius.circular(10)),
            //                     child: Text(categoryList[index]));
            //               },
            //             );
            //     })
          ],
        ),
      ),
    ));
  }
}
