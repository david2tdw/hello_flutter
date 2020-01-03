import 'package:hello_flutter/data/dao/repos_dao.dart';
import 'package:hello_flutter/model/TrendingRepoModel.dart';
import 'package:rxdart/rxdart.dart';

class TrendBloc {
  bool _requested = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool get requested => _requested;

  // rxdart 实现的 stream
  var _subject = PublishSubject<List<TrendingRepoModel>>();

  // 获取API 返回结果stream (List<TrendingRepoModel>)
  Observable<List<TrendingRepoModel>> get stream => _subject.stream;

  //根据数据库和网络返回数据
  Future<void> requestRefresh(selectTime, selectType) async  {
    _isLoading = true;
    var res = await ReposDao.getTrendDao(since: selectTime.value, languageType: selectType.value);
    if (res != null && res.result) {
      _subject.add(res.data);
    }
    await doNext(res);
    _isLoading = false;
    _requested = true;
    return;
  }

  ///请求next，是否有网络
  doNext(res) async {
    if (res.next != null) {
      var resNext = await res.next();
      if (resNext != null && resNext.result) {
        _subject.add(resNext.data);
      }
    }
  }
}