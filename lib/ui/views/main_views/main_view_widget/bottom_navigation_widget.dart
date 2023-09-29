import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enums/bottom_navigation_enum.dart';
import 'package:flutter_application_1/core/services/cart_service.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum navitm;
  final Function(BottomNavigationEnum, int) ontap;
  const BottomNavigationWidget(
      {super.key, required this.navitm, required this.ontap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          width: screenWidth(1),
          height: screenHeight(10),
          decoration: BoxDecoration(
              color: AppColors.whitecolor,
              borderRadius: BorderRadius.circular(9)),
        ),
        Positioned(
          bottom: screenWidth(12),
          left: screenWidth(20),
          right: screenWidth(20),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navItem(
                    ontap: () {
                      widget.ontap(BottomNavigationEnum.PRODUCTS, 0);
                    },
                    size: size,
                    imagename: 'products',
                    isslected: widget.navitm == BottomNavigationEnum.PRODUCTS),
                SizedBox(
                  width: screenWidth(12),
                ),
                navItem(
                    ontap: () {
                      widget.ontap(BottomNavigationEnum.HOME, 1);
                    },
                    size: size,
                    imagename: 'home',
                    isslected: widget.navitm == BottomNavigationEnum.HOME),
                SizedBox(
                  width: screenWidth(12),
                ),
                Stack(alignment: AlignmentDirectional.topEnd, children: [
                  navItem(
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.CART, 2);
                      },
                      size: size,
                      imagename: 'cart',
                      isslected: widget.navitm == BottomNavigationEnum.CART),
                  Obx(() {
                    return Visibility(
                        visible: cartService.cartCount != 0,
                        child: CircleAvatar(
                          child: Text(
                            cartService.cartCount.toString(),
                            style: TextStyle(
                                color: AppColors.whitecolor,
                                fontSize: screenWidth(50)),
                          ),
                          backgroundColor: AppColors.redcolor,
                          minRadius: 5,
                          maxRadius: 10,
                        ));
                  })
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget navItem(
      {required Size size,
      required String imagename,
      required bool isslected,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/images/$imagename.svg',
            color: isslected ? AppColors.bluecolor : AppColors.blacktext,
            width: screenWidth(10),
          ),
        ],
      ),
    );
  }
}
