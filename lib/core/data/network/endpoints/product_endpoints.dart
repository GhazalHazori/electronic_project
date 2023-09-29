import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/core/data/network/network_config.dart';

class ProductEndpoints {
  static String getproductycategory = NetworkConfig.getFullApiUrl('category/');
  static String getall = NetworkConfig.getFullApiUrl('');
}
