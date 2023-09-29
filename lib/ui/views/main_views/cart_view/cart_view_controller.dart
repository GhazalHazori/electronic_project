import 'package:flutter_application_1/core/services/base_controller.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:flutter_application_1/ui/views/check_out_view/check_out_view.dart';
import 'package:get/get.dart';

import '../../../../core/data/model/apis/cart_model.dart';

class CartController extends BaseControoler {
  List<CartModel> get cartList => cartService.cartList;

  @override
  void onInit() {
    super.onInit();
  }

  void removeFromCart(CartModel model) {
    cartService.removeFromCart(
      model: model,
    );
  }

  void changeCount(bool incress, CartModel model) {
    cartService.changeCount(
      incress: incress,
      model: model,
    );
  }

  void checkout() {
    runFullLoadingFunction(
        function: Future.delayed(Duration(seconds: 2)).then((value) {
      Get.off(CheckoutView());
    }));
  }
}
