import 'package:hello_flutter/services/network_service_response.dart';

enum ApiType { performOTP, performLogin, getProductInfo }

class FetchProcess<T> {
  ApiType type;
  bool loading;
  NetworkServieResponse<T> response;

  FetchProcess({this.loading, this.response, this.type});
}
