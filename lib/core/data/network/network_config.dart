import 'package:flutter_application_1/core/enums/request_type.dart';
import 'package:flutter_application_1/ui/shared/utlis.dart';

class NetworkConfig {
  static String BASE_API = '/products/';
  static String getFullApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
      RequestType? type = RequestType.POST,
      Map<String, String>? extraHeaders = const {}}) {
    return {
      'Accept-Language': storage.getAppLangauge(),
      if (needAuth!)
        'Authorization': 'Bearer ${storage.getTokenInfo()?.accessToken ?? ''}',
      if (type == RequestType.POST) 'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }
  //     {bool? needAuth = true,
  //     RequestType? type = RequestType.POST,
  //     Map<String, String>? extraHeaders = const {}}) {
  //   return {
  //     if (needAuth!)
  //       'Authorization':
  //           'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiQ3VzdG9tZXIiLCJuYW1lIjoiMiIsIm5iZiI6MTY4NDA4MTQ5NCwiZXhwIjoxNjg0NTk5ODk0LCJpYXQiOjE2ODQwODE0OTR9.VRHLAc7hRMm5NVU32sMWIP3HqhTdYHGlKSnkTsdqEcY',
  //     if (type == RequestType.POST) 'Content-Type': 'application/json',
  //     ...extraHeaders!
  //   };
  // }
}
