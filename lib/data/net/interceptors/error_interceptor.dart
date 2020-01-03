
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:hello_flutter/data/net/result_data.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;
  ErrorInterceptors(this._dio);

  @override
  Future onRequest(RequestOptions options) async{
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new ResultData(
        '-1',
        false,
        -1,
      ))
;    }
  }
}