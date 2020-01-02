import 'dart:async';
import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:hello_flutter/data/api/wan_android_api_client.dart';
import 'package:hello_flutter/logic/viewmodel/wan_view_model.dart';
import 'package:hello_flutter/model/models.dart';

class WanBloc {
  final WanViewModel bannerViewModel = WanViewModel();
  final bannerController = StreamController<List<BannerModel>>();
  final articleController = StreamController<List<ArticleModel>>();

  // get方法返回controller的stream
  Stream<List<BannerModel>> get bannerItems =>bannerController.stream;
  Stream<List<ArticleModel>> get articleItems => articleController.stream;

  // 构造函数通过viewModel获取数据
  WanBloc() {
    // bannerController.add(bannerViewModel.getBanner());
    // articleController.add(bannerViewModel.getArticle());
    print('WanBloc...');
  }

 void getBanner() async {
    WanAndroidApiClient wanAndroidApiClient = new WanAndroidApiClient();
    // List<BannerModel> banners = await wanAndroidApiClient.getBanner();
    Map banners = await wanAndroidApiClient.getBanner();
    // String banners = await wanAndroidApiClient.getBanner();
    // Map<String, dynamic> responseJson = json.decode(banners);
    // // BannerModel bannerModel = new BannerModel();
    BannerModel bannerModel = BannerModel.fromJson(banners);
    List<BannerModel> list = new List<BannerModel>();
    list.add(bannerModel);
    bannerController.add(list);
    // print('aaaaaaaaaaaaaaaa');
    // print(banners.toString());
    // List<BannerModel> banners;
    // return banners;
  }

  void getArticle ()  async {
    WanAndroidApiClient wanAndroidApiClient = new WanAndroidApiClient();
    // List<ArticleModel> articles = await wanAndroidApiClient.getArticleList();
    // print(articles.toString());
    // List<ArticleModel> article;
    Map articles = await wanAndroidApiClient.getArticleList();
    ArticleModel articleModel = ArticleModel.fromJson(articles);
    List<ArticleModel> list = new List<ArticleModel>();
    list.add(articleModel);
    print('getArticle:' + list.toString());
    articleController.add(list);
  }
  void dispose() {
    bannerController?.close();
    articleController?.close();
  }
}

