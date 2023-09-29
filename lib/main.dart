import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/data/repositories/shared_preference_repository.dart';
import 'package:flutter_application_1/core/services/cart_service.dart';
import 'package:flutter_application_1/core/services/connectivity_service.dart';
import 'package:flutter_application_1/my_app/my_app.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync(() async {
    var sharedPref = SharedPreferences.getInstance();
    return sharedPref;
  });
  Get.put(SharedPrefrenceRepository());
  Get.put(CartService());
  Get.put(ConnectivityService());
  runApp(MyApp());
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        width: toDouble(),
      );
}

//fit:boxfit.cover