import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:flutter_application_1/ui/views/check_out_view/check_out_view.dart';
import 'package:flutter_application_1/ui/views/main_views/cart_view/cart_view_controller.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
  CartView({
    super.key,
  });

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Obx(() {
        return ListView(
          // scrollDirection: Axis.vertical,
          children: [
            20.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(30)),
              child: Text(
                "Cart",
                style: TextStyle(
                    color: AppColors.blacktext,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth(13)),
              ),
            ),
            10.ph,
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(25), vertical: screenWidth(15)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.whitecolor,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: AppColors.greycolor.withOpacity(0.5),
                              width: 2)),
                      child: Column(children: [
                        Row(
                          children: [
                            300.pw,
                            InkWell(
                              onTap: () {
                                controller
                                    .removeFromCart(controller.cartList[index]);
                              },
                              child: Icon(
                                Icons.backspace_outlined,
                                color: AppColors.redcolor,
                              ),
                            ),
                          ],
                        ),
                        Row(children: [
                          CachedNetworkImage(
                            width: screenWidth(7),
                            height: screenHeight(6),
                            imageUrl:
                                controller.cartList[index].product?.image ?? '',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          Column(
                            children: [
                              Text(
                                controller.cartList[index].product?.title ?? '',
                                maxLines: 1,
                                style: TextStyle(fontSize: screenWidth(30)),
                              ),
                              Row(children: [
                                Text(
                                  "Price:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.bluecolor,
                                      fontSize: screenWidth(30)),
                                ),
                                Text(controller.cartList[index].product!.price
                                    .toString()),
                              ]),
                              Row(children: [
                                Text(
                                  "Total:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.bluecolor,
                                      fontSize: screenWidth(30)),
                                ),
                                Text(
                                  controller.cartList[index].total.toString(),
                                  style: TextStyle(fontSize: screenWidth(30)),
                                ),
                              ])
                            ],
                          ),
                        ]),
                        Row(
                          children: [
                            180.pw,
                            ElevatedButton(
                                onPressed: () {
                                  controller.changeCount(
                                      true, controller.cartList[index]);
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
                              controller.cartList[index].count.toString(),
                              style: TextStyle(
                                  color: AppColors.blacktext,
                                  fontSize: screenWidth(30)),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  controller.changeCount(
                                      false, controller.cartList[index]);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.bluecolor,
                                    shape: CircleBorder()),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                      fontSize: screenWidth(15),
                                      color: AppColors.whitecolor),
                                )),
                          ],
                        ),
                      ]),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: screenWidth(1),
                    height: 2,
                    color: AppColors.mainorangecolor,
                  );
                },
                itemCount: controller.cartList.length),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    10.ph,
                    Container(
                      width: screenWidth(1),
                      height: screenWidth(150),
                      color: AppColors.bluecolor,
                    ),
                    Row(children: [
                      10.pw,
                      Text(
                        "Sub Total:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.bluecolor,
                            fontSize: screenWidth(20)),
                      ),
                      Text(
                        "${cartService.subTotal.value} SP",
                        style: TextStyle(
                            color: AppColors.blacktext,
                            fontSize: screenWidth(25),
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                    10.ph,
                    Container(
                      width: screenWidth(1),
                      height: screenWidth(150),
                      color: AppColors.bluecolor.withOpacity(0.5),
                    ),
                    10.ph,
                    Row(children: [
                      10.pw,
                      Text(
                        "Tax:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.bluecolor,
                            fontSize: screenWidth(20)),
                      ),
                      Text("${cartService.tax.value} SP",
                          style: TextStyle(
                              color: AppColors.blacktext,
                              fontSize: screenWidth(25),
                              fontWeight: FontWeight.bold)),
                    ]),
                    10.ph,
                    Container(
                      width: screenWidth(1),
                      height: screenWidth(150),
                      color: AppColors.bluecolor.withOpacity(0.5),
                    ),
                    Row(children: [
                      10.pw,
                      Text(
                        "Delivery Fees:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.bluecolor,
                            fontSize: screenWidth(20)),
                      ),
                      Text("${cartService.delivery.value}SP",
                          style: TextStyle(
                              color: AppColors.blacktext,
                              fontSize: screenWidth(25),
                              fontWeight: FontWeight.bold)),
                    ]),
                    10.ph,
                    Container(
                      width: screenWidth(1),
                      height: screenWidth(150),
                      color: AppColors.bluecolor.withOpacity(0.5),
                    ),
                    10.ph,
                    Row(children: [
                      10.pw,
                      Text(
                        "Total: ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.redcolor,
                            fontSize: screenWidth(20)),
                      ),
                      Text("${cartService.total.value}SP",
                          style: TextStyle(
                              color: AppColors.blacktext,
                              fontSize: screenWidth(25),
                              fontWeight: FontWeight.bold)),
                    ]),
                    Container(
                      width: screenWidth(1),
                      height: screenWidth(150),
                      color: AppColors.bluecolor,
                    ),
                    20.ph,
                    CustomButtonNew(
                        text: "Placed Order",
                        backgroundcolor: AppColors.bluecolor,
                        textsize: screenWidth(20),
                        onpressed: () {
                          controller.checkout();
                        }),
                    20.ph,
                    InkWell(
                      onTap: () {
                        cartService.clearCart();
                      },
                      child: Column(
                        children: [
                          Text(
                            " Empty Cart",
                            style: TextStyle(
                                color: AppColors.redcolor,
                                fontSize: screenWidth(20)),
                          ),
                          Container(
                            width: screenWidth(4),
                            height: screenHeight(300),
                            color: AppColors.redcolor.withOpacity(0.8),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ],
        );
      }),
    ));
  }
}
