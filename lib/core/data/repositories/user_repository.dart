// import 'package:bot_toast/bot_toast.dart';
// import 'package:dartz/dartz.dart';

// import 'package:resturant/core/data/models/apis/token_info.dart';
// import 'package:resturant/core/data/network/endpoints/user_endpoints.dart';

// import '../../enums/request_type.dart';
// import '../../utils/network_util.dart';
// import '../models/common_response.dart';
// import '../network/network_config.dart';

// class UserRepository {
//   Future<Either<String, TokenInfo>> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//         type: RequestType.POST,
//         url: UserEndPoints.login,
//         body: {
//           'userName': email,
//           'password': password,
//         },
//         headers: NetworkConfig.getHeaders(needAuth: false),
//       ).then((response) {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(response);

//         if (commonResponse.getStatus) {
//           return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
//         } else {
//           return Left(commonResponse.message ?? '');
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
// }

import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/data/model/apis/token_info.dart';
import 'package:flutter_application_1/core/data/model/common_response.dart';
import 'package:flutter_application_1/core/data/network/endpoints/user_endpoints.dart';
import 'package:flutter_application_1/core/data/network/network_config.dart';
import 'package:flutter_application_1/core/enums/request_type.dart';
import 'package:flutter_application_1/core/utils/network_util.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String email,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: UserEndPoints.login,
        body: {
          'userName': email,
          'password': password,
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required int age,
    required String photo,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: UserEndPoints.register,
        fields: {
          'Email': email,
          'FirstName': firstname,
          'LastName': lastname,
          'Password': password,
          'Age': age.toString(),
        },
        files: {"Photo": photo},
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
