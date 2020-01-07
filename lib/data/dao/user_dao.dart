import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hello_flutter/data/config/config.dart';
import 'package:hello_flutter/data/config/ignoreConfig.dart';
import 'package:hello_flutter/data/dao/data_result.dart';
import 'package:hello_flutter/data/local/local_storage.dart';
import 'package:hello_flutter/data/net/address.dart';
import 'package:hello_flutter/data/net/http_manager.dart';
import 'package:hello_flutter/model/User.dart';
import 'package:hello_flutter/redux/reducer/user_reducer.dart';
import 'package:redux/redux.dart';

class UserDao {
 static clearAll (Store store) async {
   httpManager.clearAuthorization();
   LocalStorage.remove(Config.USER_INFO);
   store.dispatch(new UpdateUserAction(User.empty()));
 }

  static login (userName, password, store)  async  {
    String type = userName + ":" + password;
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);
    if (Config.DEBUG) {
      print("base64Str login " + base64Str);
    }

    await LocalStorage.save(Config.USER_NAME_KEY, userName);
    await LocalStorage.save(Config.USER_BASIC_CODE, base64Str);

    Map requestParams = {
      "scopes": ['user', 'repo', 'gist', 'notifications'],
      "note": "admin_script",
      "client_id": NetConfig.CLIENT_ID,
      "client_secret": NetConfig.CLIENT_SECRET
    };
    httpManager.clearAuthorization();

    var res = await httpManager.netFetch(Address.getAuthorization(), json.encode(requestParams), null, new Options(method: "post"));
    var resultData = null;
    if (res != null && res.result) {
      await LocalStorage.save(Config.PW_KEY, password);
      var resultData = await getUserInfo(null);
      if (Config.DEBUG) {
        print("user result " + resultData.result.toString());
        print(resultData.data);
        print(res.data.toString());
      }
      store.dispatch(new UpdateUserAction(resultData.data));
    }
    return new DataResult(resultData, res.result);
  }
 static getUserInfo(userName) async  {

 }
}