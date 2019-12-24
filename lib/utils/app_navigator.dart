import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/model/movie_item.dart';
import 'package:hello_flutter/ui/widgets/web_view.scene.dart';

class AppNavigator {
  static push(BuildContext context, Widget scene) {
    Navigator.push(context, CupertinoPageRoute(
      builder: (BuildContext context) => scene,
    ));
  }

  // 进入 webview
  static pushWeb(BuildContext context, String url, String title) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) {
        return WebViewScene(url:url, title: title);
      }),
    );
  }

  // 进入电影详情
  // todo
  static pushMovieDetail(BuildContext context, MovieItem movie) {
    print('pushMovieDetail todo.');
    // AppNavigator.push(context, MovieDetailView(id: movie.id,));
  }

  //// 进入电影列表页面
  static pushMovieList(BuildContext context, String title, String action) {

  }
}