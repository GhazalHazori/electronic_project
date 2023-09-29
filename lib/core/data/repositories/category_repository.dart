import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/data/model/common_response.dart';
import 'package:flutter_application_1/core/data/network/endpoints/category_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../network/network_config.dart';

class CategoryRepository {
  Future<Either<String, List<String>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: CategoryEndpoints.getall,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<String> result = [];
          commonResponse.data!.insert(0, "All");
          commonResponse.data!.forEach(
            (element) {
              result.add(element);
            },
          );
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
