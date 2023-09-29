import 'package:flutter_application_1/core/data/network/network_config.dart';

class UserEndPoints {
  static String login = NetworkConfig.getFullApiUrl('user/login');
  static String register = NetworkConfig.getFullApiUrl('User/Register');
}
