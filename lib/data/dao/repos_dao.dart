import 'package:hello_flutter/data/config/config.dart';
import 'package:hello_flutter/data/dao/data_result.dart';
import 'package:hello_flutter/data/net/address.dart';
import 'package:hello_flutter/data/net/http_manager.dart';
import 'package:hello_flutter/model/TrendingRepoModel.dart';

class ReposDao {
  /*
   * 趋势数据
   * @param page 分页，趋势数据其实没有分页
   * @param since 数据时长， 本日，本周，本月
   * @param languageType 语言
   */
  static getTrendDao({since = 'daily', languageType, page = 0}) async {
    next() async {
      String url = Address.trendingApi(since, languageType);
      var result = await httpManager.netFetch(
        url,
        null,
        {"api-token": Config.API_TOKEN}, null, noTip: true,
      );
      if (result != null && result.result && result.data is List) {
        List<TrendingRepoModel> list = new List();
        var data = result.data;
        if (data == null || data.length == 0) {
          return new DataResult(null, false);
        }

        for (int i = 0 ; i < data.length; i++) {
          TrendingRepoModel model = TrendingRepoModel.fromJson(data[i]);
          list.add(model);
        }
        return new DataResult(list, true);
      } else {
        // todo
        // String url = Address.trending(since, languageType);
        
      }
      return await next();
    }
  }
}
