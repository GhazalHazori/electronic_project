import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_1/core/enums/connectivity_status.dart';
import 'package:get/get.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectivityStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((event) {
      connectivityStatusController.add(getStauts(event));
    });
  }
  ConnectivityStatus getStauts(ConnectivityResult value) {
    switch (value) {
      case ConnectivityResult.bluetooth:
        return ConnectivityStatus.ONLINE;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.ethernet:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.mobile:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.none:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.vpn:
        return ConnectivityStatus.ONLINE;

      case ConnectivityResult.other:
        return ConnectivityStatus.ONLINE;
    }
  }
}
