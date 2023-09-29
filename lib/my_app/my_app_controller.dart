import 'package:flutter_application_1/core/enums/connectivity_status.dart';
import 'package:flutter_application_1/core/services/base_controller.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';

class MyAppContoller extends BaseControoler {
  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;
  @override
  void onInit() {
    listenToConnectionStatus();

    super.onInit();
  }

  void listenToConnectionStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      connectionStatus = event;
    });
  }
}
