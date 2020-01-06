import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hello_flutter/model/ReposViewModel.dart';
import 'package:hello_flutter/model/TrendingRepoModel.dart';
import 'package:hello_flutter/redux/gsy_state.dart';
import 'package:hello_flutter/ui/page/trending/trend_bloc.dart';
import 'package:hello_flutter/ui/widgets/repos_item.dart';
import 'package:hello_flutter/utils/navigator_util.dart';

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
  //空页面
  Widget _buildEmpty() {
    var statusBar = MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top;
    var bottomArea = MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.bottom;
    var height = MediaQuery.of(context).size.height - statusBar - bottomArea - kBottomNavigationBarHeight - kToolbarHeight;
    return SingleChildScrollView(
      child: new Container(
        height: height,
        width: MediaQuery.of(context).size.width,
        child:  new Column(
          mainAxisAlignment: MainAxisAlignment.center
        ,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: new Image(
              image: new AssetImage('assets/images/pk.jpg'),
              width: 70.0,
              height: 70.0,
            ),
          ),
          Container(
            child: Text(
              "empty content",
              style: TextStyle(
                color: Color(0xFF121917),
                fontSize: 18.0
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new StoreBuilder<GSYState>(
      builder: (context, store) {
        return new Scaffold(
          backgroundColor: Color(0xffececec),
          //采用目前采用纯 bloc 的 rxdart(stream) + streamBuilder
          body: StreamBuilder<List<TrendingRepoModel>>(
            stream: trendBloc.stream,
            builder: (context, snapshot) {
              return new NestedScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[];
                },
                body: (snapshot.data == null || snapshot.data.length == 0) ? _buildEmpty() : new ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return _renderItem(snapshot.data[index]);
                  },
                  itemCount: snapshot.data.length,
                ), 
                
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              
            },
            child: Icon(
              Icons.person,
              size: 30,
            ),
          ),
        );
      },
    );
    // return Container(
    //   child: Center(
    //     child: Text(
    //       'tdw'
    //     ),
    //   )
    // );
  }

  //绘制tiem
  _renderItem(e) {
    ReposViewModel reposViewModel = ReposViewModel.fromTrendMap(e);
    return new ReposItem(reposViewModel,
    onPressed: () {

    },
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