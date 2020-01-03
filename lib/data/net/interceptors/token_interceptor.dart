import 'package:dio/dio.dart';
import 'package:hello_flutter/data/config/config.dart';
import 'package:hello_flutter/data/local/local_storage.dart';
import 'package:hello_flutter/data/net/graphql/client.dart';

class TokenInterceptors extends InterceptorsWrapper {
  String _token;
  // 重写dio 的request和response方法
  @override
  onRequest(RequestOptions options) async {
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
        initClient(_token);
      }
    }
    options.headers["Authorization"]  = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = 'token ' + responseJson["token"];
        await LocalStorage.save(Config.TOKEN_KEY, _token);
      }
    }catch (e) {
      print(e);
    }
    return response;
  }

  //清除授权
  clearAuthorization () {
    this._token = null;
    LocalStorage.remove(Config.TOKEN_KEY);
    releaseClient();
  }

  ///获取授权token
  getAuthorization() async {
    String token = await LocalStorage.get(Config.TOKEN_KEY);
    if (token == null) {
      String basic = await LocalStorage.get(Config.USER_BASIC_CODE);
      if (basic == null) {
        //提示输入账号密码
      } else {
        //通过 basic 去获取token，获取到设置，返回token
        return "Basic $basic";
      }
    } else  {
      this._token = token;
      return token;
    }
  }
}
