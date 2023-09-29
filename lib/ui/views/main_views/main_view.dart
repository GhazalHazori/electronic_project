import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enums/bottom_navigation_enum.dart';
import 'package:flutter_application_1/ui/views/main_views/cart_view/cart_view.dart';
import 'package:flutter_application_1/ui/views/main_views/all_product_view/all_product_view.dart';
import 'package:flutter_application_1/ui/views/main_views/cart_view/cart_view.dart';
import 'package:flutter_application_1/ui/views/main_views/category_view/category_view.dart';
import 'package:flutter_application_1/ui/views/main_views/main_view_widget/bottom_navigation_widget.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 1);
  BottomNavigationEnum selected = BottomNavigationEnum.HOME;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  //maincontroller controller = Get.put(maincontroller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: key,
      bottomNavigationBar: BottomNavigationWidget(
        navitm: selected,
        ontap: (select, pagenumber) {
          controller.jumpToPage(pagenumber);

          setState(() {
            selected = select;
          });
        },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [AllProductView(), CategoryView(), CartView()],
      ),
    ));
  }
}
