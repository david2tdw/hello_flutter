import 'package:flutter/material.dart';
import 'package:hello_flutter/model/movie_item.dart';
import 'package:hello_flutter/ui/page/douban/home_movie_cover_view.dart';
import 'package:hello_flutter/ui/page/douban/home_section_view.dart';

class MovieThreeGridView extends StatelessWidget {
  final List<MovieItem> movies;
  final String title;
  final String action;

  MovieThreeGridView(this.movies, this.title, this.action);

  @override
  Widget build(BuildContext context) {
    var children;

    switch (title) {
      case '影院热映':
        children = movies.map((movie) => HomeMovieCoverView(movie)).toList();
        break;
      case '':
        // todo
        children = movies.map((movie) => Container()).toList();
        break;
      default:
        break;
    }
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeSectionView(title, action),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Wrap(
              spacing: 15,
              runSpacing: 20,
              children: children,
            ),
          ),
          Container(
            height: 10,
            color: Color(0xFFF5F5F5),
          )
        ],
      ),
    );
  }
}
