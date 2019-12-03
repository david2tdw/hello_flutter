import 'dart:convert';

import 'package:hello_flutter/services/network_service_response.dart';
import 'package:http/http.dart' as http;
class RestClient {
  Map<String, String> headers = {
    "CONTENT_TYPE": 'application/json',
    "ACCEPT": 'application/json',
  };
  Future<MappedNetworkserviceResponse<T>> getAsync<T> (String resourcePath) async {
    var response  = await http.get(resourcePath);
    return processResponse<T>(response);
  }


  Future<MappedNetworkserviceResponse<T>> postAsync<T> (String resourcePath, dynamic data) async {
    String content  = json.encoder.convert(data);
    var response = await http.post(resourcePath, body: content, headers: headers);
    return processResponse(response);
  }

  MappedNetworkserviceResponse<T> processResponse<T> (http.Response response) {
    if (!((response.statusCode < 200) || (response.statusCode >=300) || (response.body == null))) {
      var jsonResult = response.body;
      dynamic resultClass  = jsonDecode(jsonResult);
      return new MappedNetworkserviceResponse<T>(
        mappedResult: resultClass,
        networkServieResponse: new NetworkServieResponse<T>(success: true)
      );
    } else {
      var errorResponse = response.body;
      return new MappedNetworkserviceResponse<T>(
        networkServieResponse: new NetworkServieResponse<T>(
          success: false,
          message: "(${response.statusCode}) ${errorResponse.toString()}"
        )
      );
    }
  }
}