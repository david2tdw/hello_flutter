import 'package:dio/dio.dart';
import 'package:hello_flutter/data/api/wan_android_api_client.dart';
import 'package:hello_flutter/model/models.dart';


class WanViewModel {
  List<BannerModel> bannerList;
  List<ArticleModel> articleList;

  WanViewModel({
    this.bannerList,
    this.articleList,
  });

  // getBannerList() => _getBanner;

  // getArticleList() => _getArticle;

  // Future<List<BannerModel>> getBanner() async {
  //   WanAndroidApiClient wanAndroidApiClient = new WanAndroidApiClient();
  //   Response<Map> res = await wanAndroidApiClient.getBanner();
  //   print('aaaaaaaaaaaaaaaa');
  //   print(res.toString());
  //   List<BannerModel> banners;
  //   return banners;
  // }

  // Future<List<ArticleModel>> getArticle ()  async {
  //   WanAndroidApiClient wanAndroidApiClient = new WanAndroidApiClient();
  //   Response<Map> res = await wanAndroidApiClient.getArticleList();
  //   print(res.toString());
  //   List<ArticleModel> article;

  //   return article;
  // }
   
}