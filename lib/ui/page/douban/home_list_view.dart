import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/logic/logic-utils/movie_data_util.dart';
import 'package:hello_flutter/model/movie_news.dart';
import 'package:hello_flutter/ui/page/douban/home_news_banner_view.dart';
import 'package:hello_flutter/ui/page/douban/movie_three_grid_view.dart';
import 'package:hello_flutter/utils/api_client.dart';
import 'package:hello_flutter/utils/uidata.dart';

class HomeListView extends StatefulWidget {
  HomeListView();

  @override
  _HomeListViewState createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView>
    with AutomaticKeepAliveClientMixin {
  int pageIndex = 0;
  var newsList;
  var nowPlayingList, comingList;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    ApiClient client = new ApiClient();
    List<MovieNews> news = await client.getNewsList();
    var nowPlayingData = await client.getNowPlayingList(start: 0, count: 6);
    // var comingListData = await client.getComingList(start: 0, count: 6);

    setState(() {
      newsList = news2Banner(news);
      // newsList = news;
      // comingList = MovieDataUtil.getMovieList(comingListData);
      nowPlayingList = MovieDataUtil.getMovieList(nowPlayingData);
      // classifyMovieList = classifyMovies;
      // classifyMovieTags = tags;
    });
    print('newslist:' + newsList.toString());
  }

  List<NewsBanner> news2Banner(var list) {
    print('news2Banner:' + list.toString());
    List content = list;
    List<NewsBanner> banners = [];
    content.forEach((data) {
      banners.add(new NewsBanner(data));
    });
    return banners;
  }

  @override
  Widget build(BuildContext context) {
    if (nowPlayingList == null) {
      return new Center(
        child: new CupertinoActivityIndicator(),
      );
    } else {
      return Container(
        child: RefreshIndicator(
          color: UIData.primary,
          onRefresh: fetchData,
          child: ListView(
            addAutomaticKeepAlives: true,
            // 防止 children 被重绘，
            cacheExtent: 10000,
            children: <Widget>[
              new NewsBannerView(newsList),
              new MovieThreeGridView(nowPlayingList, '影院热映', 'in_theaters'),
              // new MovieThreeGridView(comingList, '即将上映', 'coming_soon'),
            ],
          ),
        ),
      );
    }
  }

  // 保持页面状态
  @override
  bool get wantKeepAlive => true;
}
