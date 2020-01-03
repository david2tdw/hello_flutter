import 'package:dio/dio.dart';

class HeaderInterceptors extends InterceptorsWrapper {

@override
  Future onRequest(RequestOptions options) async{
    options.connectTimeout = 30000;
    return options;
  }
}