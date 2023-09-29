import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_button_new.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:flutter_application_1/ui/views/main_views/category_view/category_view.dart';
import 'package:get/get.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  CheckoutView controller = Get.put(CheckoutView());
  @override
  void initState() {
    storage.setOrderPlaced(true);
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          screenWidth(10).ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
            child: Text(
              "Your order placed successfully",
              style: TextStyle(
                  color: AppColors.blacktext,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(15)),
            ),
          ),
          10.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
            child: Row(
              children: [
                Text(
                  "Order No: ",
                  style: TextStyle(
                      color: AppColors.bluecolor,
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "#12390",
                  style: TextStyle(
                      color: AppColors.blacktext,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth(20)),
                )
              ],
            ),
          ),
          screenWidth(20).ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
            child: Row(
              children: [
                Text(
                  "Items Count: ",
                  style: TextStyle(color: AppColors.bluecolor),
                ),
                Text(
                  cartService.cartCount.toString(),
                  style: TextStyle(
                      color: AppColors.blacktext, fontSize: screenWidth(20)),
                )
              ],
            ),
          ),
          screenWidth(20).ph,
          Container(
            width: screenWidth(1.1),
            height: screenWidth(100),
            color: AppColors.bluecolor,
          ),
          screenWidth(30).ph,
          Text(
            'sub Total:${cartService.subTotal.value}',
            style: TextStyle(
                fontSize: screenWidth(20), fontWeight: FontWeight.bold),
          ),
          screenWidth(20).ph,
          Container(
            width: screenWidth(1.1),
            height: screenWidth(100),
            color: AppColors.bluecolor.withOpacity(0.5),
          ),
          screenWidth(30).ph,
          Text(
            'Tax:${cartService.tax.value}',
            style: TextStyle(
                fontSize: screenWidth(20), fontWeight: FontWeight.bold),
          ),
          screenWidth(20).ph,
          Container(
            width: screenWidth(1.1),
            height: screenWidth(100),
            color: AppColors.bluecolor.withOpacity(0.5),
          ),
          screenWidth(30).ph,
          Text(
            ' Delivery:${cartService.delivery.value}',
            style: TextStyle(
                fontSize: screenWidth(20), fontWeight: FontWeight.bold),
          ),
          screenWidth(30).ph,
          Container(
            width: screenWidth(1.1),
            height: screenWidth(100),
            color: AppColors.bluecolor.withOpacity(0.5),
          ),
          screenWidth(30).ph,
          Text(
            'Total:${cartService.total.value}',
            style: TextStyle(
                fontSize: screenWidth(20), fontWeight: FontWeight.bold),
          ),
          screenWidth(30).ph,
          Container(
            width: screenWidth(1.1),
            height: screenWidth(100),
            color: AppColors.bluecolor,
          ),
          screenHeight(3).ph,
          ElevatedButton(
            onPressed: () {
              cartService.clearCart();
              Get.off(CategoryView());
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.bluecolor,
                shape: StadiumBorder(),
                fixedSize: Size(screenWidth(1.1), screenWidth(9))),
            child: Text(
              "continue shopping",
              style: TextStyle(
                  color: AppColors.whitecolor,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth(20)),
            ),
          ),
        ],
      ),
    ));
  }
}
