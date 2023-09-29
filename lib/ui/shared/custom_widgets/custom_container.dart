import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/repositories/product_repository.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:flutter_application_1/ui/views/main_views/category_view/category_view_controller.dart';
import 'package:get/get.dart';

class customContainer extends StatefulWidget {
  final String text;
  final int index;
  final Function? onTap;

  customContainer(
      {super.key, required this.text, required this.index, this.onTap});

  @override
  State<customContainer> createState() => _customContainerState();
}

class _customContainerState extends State<customContainer> {
  CategoryController controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          controller.selectedIndex.value = widget.index;
          controller.getAllProducts(controller.categoryList[widget.index]);
          if (widget.onTap != null) OnTap() {}

          // controller.getAllProducts(controller.categoryList[widget.index]);
        },
        child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: controller.selectedIndex == widget.index
                    ? AppColors.bluecolor
                    : AppColors.whitecolor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.greycolor)),
            child: Center(
              child: Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: screenWidth(20),
                    color: controller.selectedIndex == widget.index
                        ? AppColors.whitecolor
                        : AppColors.blacktext),
              ),
            )),
      );
    });
  }
}
