import 'package:flutter_application_1/core/data/model/apis/product_model.dart';
import 'package:flutter_application_1/core/services/base_controller.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:flutter_application_1/ui/views/main_views/cart_view/cart_view.dart';

import 'package:get/get.dart';

class ProductDatailsController extends BaseControoler {
  ProductDatailsController(ProductModel mealmodel) {
    model = mealmodel;
  }
  ProductModel model = ProductModel();
  RxInt count = 1.obs;
  void changecount(bool increes) {
    if (increes) {
      count++;
    } else {
      if (count > 1) {
        count--;
      }
    }
  }

  double calcTotal() {
    return (count.value * model.price!).toDouble();
  }

  // void addTocart() {
  //   List<CartModel> list = storage.getCartList();
  //   CartModel result = list.firstWhere(
  //       (element) => element.meal!.id == model.id,
  //       orElse: () => CartModel());
  //   if (result.meal != null) {
  //     int index = list.indexOf(result);
  //     list[index].count = list[index].count! + count.value;
  //     list[index].total = list[index].total! + calcTotal();
  //   } else {
  //     list.add(CartModel(count: count.value, total: calcTotal(), meal: model));
  //   }

  //   storage.setCartList(list);
  // }
  void addToCart() {
    cartService.addToCart(
        model: model,
        count: count.value,
        afterAdd: () {
          Get.to(CartView());
        });
  }
}
