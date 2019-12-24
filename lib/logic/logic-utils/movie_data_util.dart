import 'package:hello_flutter/model/movie_item.dart';
import 'package:hello_flutter/model/movie_photo.dart';

class MovieDataUtil {
  static List<MovieItem> getMovieList(list) {
    print(list);
    List content = list;
    List<MovieItem> movies = [];

    content.forEach((data) {
      movies.add(MovieItem.fromJson(data));
    });
    return movies;
  }

  static List<MoviePhoto> getPhotoList(list) {
    List content = list;
    List<MoviePhoto> photos = [];
    content.forEach((data) {
      photos.add(MoviePhoto.fromJson(data));
    });
    return photos;
  }
}