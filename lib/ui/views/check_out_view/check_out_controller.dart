import 'package:flutter_application_1/core/services/base_controller.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';
import 'package:get/get.dart';


class CheckoutController extends BaseControoler {
  @override
  void onClose() {
    cartService.clearCart();
    // Get.off(MainView());
    super.onClose();
  }
}
