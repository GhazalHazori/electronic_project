import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_application_1/core/enums/operation_type.dart';
import 'package:flutter_application_1/core/enums/request_statues.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';

import 'package:get/get.dart';

class BaseControoler extends GetxController {
  Rx<RequestStatus> requestStatus = RequestStatus.DEFUALT.obs;
  Rx<OperationType> operationType = OperationType.NONE.obs;
  Future runFutureFunction({required Future function}) async {
    // checkConnection(() async {
    await function;
    // });
  }

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    // checkConnection(() async {
    requestStatus.value = RequestStatus.LOADING;
    operationType.value = type!;
    await function;
    requestStatus.value = RequestStatus.DEFUALT;
    operationType.value = OperationType.NONE;
    // });
  }

  Future runFullLoadingFunction({required Future function}) async {
    // checkConnection(() async {
    customLoader();
    await function;
    BotToast.closeAllLoading();
    // });
  }
}
