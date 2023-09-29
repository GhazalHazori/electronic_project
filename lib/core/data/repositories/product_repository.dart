import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/data/model/apis/product_model.dart';
import 'package:flutter_application_1/core/data/model/common_response.dart';
import 'package:flutter_application_1/core/data/network/endpoints/product_endpoints.dart';

import '../../enums/request_type.dart';
import '../../utils/network_util.dart';

import '../network/network_config.dart';

class ProductRepository {
  Future<Either<String, List<ProductModel>>> getAll() async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ProductEndpoints.getall,
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<ProductModel> result = [];
          commonResponse.data!.forEach(
            (element) {
              result.add(ProductModel.fromJson(element));
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

  Future<Either<String, List<ProductModel>>> getProductByCategory(
      {required category}) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: NetworkConfig.getFullApiUrl('category/${category}'),
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<List<dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          List<ProductModel> result = [];

          commonResponse.data!.forEach(
            (element) {
              result.add(ProductModel.fromJson(element));
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
