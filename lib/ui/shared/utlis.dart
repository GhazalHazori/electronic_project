import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/repositories/shared_preference_repository.dart';
import 'package:flutter_application_1/core/enums/connectivity_status.dart';
import 'package:flutter_application_1/core/enums/message_type.dart';
import 'package:flutter_application_1/core/services/cart_service.dart';
import 'package:flutter_application_1/core/services/connectivity_service.dart';
import 'package:flutter_application_1/my_app/my_app_controller.dart';
import 'package:flutter_application_1/ui/shared/colors.dart';
import 'package:flutter_application_1/ui/shared/custom_widgets/custom_toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

bool isEmail(String value) {
  RegExp regExp = new RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool ispasswordValid(String value) {
  RegExp regExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  return regExp.hasMatch(value);
}

bool isphone(String value) {
  RegExp regExp = RegExp(r'^(?:[+0]9)?[0-9]{10}');
  return regExp.hasMatch(value);
}

bool isaddress(String value) {
  RegExp regExp = RegExp(r'^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$');
  return regExp.hasMatch(value);
}

bool isname(value) {
  RegExp regExp = RegExp(r'^[A-Z][a-zA-Z]{3,}(?: [A-Z][a-zA-Z]*){0,2}$');
  return regExp.hasMatch(value);
}

double screenWidth(double perecent) {
  return Get.size.width / perecent;
}

double screenHeight(double perecent) {
  return Get.size.height / perecent;
}

SharedPrefrenceRepository get storage => Get.find<SharedPrefrenceRepository>();
CartService get cartService => Get.find<CartService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
// bool get isOnline =>
//     Get.find<MyAppContoller>().connectionStatus == ConnectivityStatus.ONLINE;
double get taxAmount => 0.18;
double get deliveryAmount => 0.1;
// void fadeInTransation(Widget view){
//   Get.to(view,transition,duration)
// }
// void customLoader() => BotToast.showCustomLoading(toastBuilder: );
void customLoader() => BotToast.showCustomLoading(toastBuilder: (builder) {
      return Container(
        width: screenWidth(5),
        height: screenWidth(5),
        decoration: BoxDecoration(
            color: AppColors.blacktext.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: SpinKitCircle(color: AppColors.mainorangecolor),
      );
    });
// void checkConnection(Function function) {
//   if (isOnline) {
//     function;
//   } else {
//     CustomToast.showMessage(
//       message: 'Please check internet connection',
//       messagetype: MessagType.WARNING,
//     );
//   }
// }
