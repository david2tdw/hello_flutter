import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/page/trending/trend_bloc.dart';

// 主页趋势tab页
// 目前采用纯 bloc 的 rxdart(stream) + streamBuilder

class TrendPage extends StatefulWidget {
  TrendPage({Key key}) : super(key: key);

  @override
  _TrendPageState createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> with AutomaticKeepAliveClientMixin<TrendPage>, SingleTickerProviderStateMixin{

  //显示数据时间
  TrendTypeModel selectTime = null;

  //显示过滤语言
  TrendTypeModel selectType = null;

  final ScrollController scrollController = new ScrollController();

  final TrendBloc trendBloc = new TrendBloc();

  _showRefreshLoading () {
    new Future.delayed(const Duration(seconds: 0), (){
      
    });
  }

  Future<void> requestRefresh()  async {
    return trendBloc.requestRefresh(selectTime, selectType);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'tdw'
        ),
      )
    );
  }

  
  @override
  void didChangeDependencies() {
    if (! trendBloc.requested) {
      setState(() {
        selectTime = trendTime(context)[0];
        selectType = trendTime(context)[0];
      });
      _showRefreshLoading();
    }
    super.didChangeDependencies();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

//趋势数据过滤显示item
class TrendTypeModel {
  final String name;
  final String value;
  TrendTypeModel(this.name, this.value);
}

// 趋势数据时间过滤
trendTime (BuildContext context) {
  return [
    new TrendTypeModel('今日', "daily"),
    new TrendTypeModel('本周', "weekly"),
    new TrendTypeModel('本月', "monthly"),
  ];
}


//趋势数据语言过滤
trendType (BuildContext context) {
  return [
    TrendTypeModel("Java", "Java"),
    TrendTypeModel("Kotlin", "Kotlin"),
    TrendTypeModel("Dart", "Dart"),
    TrendTypeModel("Objective-C", "Objective-C"),
    TrendTypeModel("Swift", "Swift"),
    TrendTypeModel("JavaScript", "JavaScript"),
    TrendTypeModel("PHP", "PHP"),
    TrendTypeModel("Go", "Go"),
    TrendTypeModel("C++", "C++"),
    TrendTypeModel("C", "C"),
    TrendTypeModel("HTML", "HTML"),
    TrendTypeModel("CSS", "CSS"),
    TrendTypeModel("Python", "Python"),
    TrendTypeModel("C#", "c%23"),
  ];
}