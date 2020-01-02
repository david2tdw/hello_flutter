import 'dart:io';
import 'dart:async';
import 'package:hello_flutter/data/api/wan_android_api.dart';
import 'package:dio/dio.dart';

class WanAndroidApiClient {
  static const String baseUrl = 'https://www.wanandroid.com/';
  var dio = WanAndroidApiClient.createDio();

  Future<dynamic> getBanner () async  {
    Response<Map> response = await dio.get(WanAndroidApi.BANNER);
    print(response.data);
    return response.data;
  }

  Future<dynamic> getArticleList () async {
    print('api client: getArticleList');
    Response<Map> response  = await dio.get(WanAndroidApi.ARTICLE_LISTPROJECT);
    print(response);
    return response.data['data'];
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
