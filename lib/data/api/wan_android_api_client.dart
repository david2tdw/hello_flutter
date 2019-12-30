import 'dart:io';
import 'dart:async';
import 'package:hello_flutter/data/api/wan_android_api.dart';
import 'package:dio/dio.dart';

class WanAndroidApiClient {
  static const String baseUrl = '';
  var dio = WanAndroidApiClient.createDio();

  Future<dynamic> getBanner () async  {
    Response<Map> response = await dio.get(WanAndroidApi.BANNER);
    print(response);
    // return response.data[''];
  }




  static Dio createDio() {
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 100000,
      contentType: ContentType.json,
    );
    return Dio(options);
  }
}
