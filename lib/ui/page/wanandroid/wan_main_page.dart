import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/res/strings.dart';
import 'package:hello_flutter/ui/page/wanandroid/search_page.dart';
import 'package:hello_flutter/utils/navigator_util.dart';
import 'package:hello_flutter/utils/uidata.dart';
import 'package:hello_flutter/utils/utils.dart';

class WanMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LogUtil.e("MainPages build......");
    return new DefaultTabController(
      length:  _allPages.length,
      child: Scaffold(
        appBar: MyAppBar(
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(UIData.aliConnorsImage),
              ),
            ),
          ),
          centerTitle: true,
          title: TabLayout(),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                NavigatorUtil.pushPage(context, SearchPage(), pageName: 'SearchPage');
              },
            ),
          ],
        ),
        body: TabBarViewLayout(),
      ),
      // child: new Scaffold(
      //   // appBar: ,
      //   backgroundColor: Colors.yellow,
      // ),
    );
  }
}

class _Page {
  final String labelId;
  _Page(this.labelId);
}

final List<_Page> _allPages = <_Page>[
  _Page('主页'),
  _Page('项目'),
  _Page('动态'),
  _Page('体系'),
];

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelPadding: EdgeInsets.all(12.0),
      indicatorSize: TabBarIndicatorSize.label,
      tabs: _allPages
          .map((_Page page) => new Tab(
                text: page.labelId,
              ))
          .toList(),
    );
  }
}
class TabBarViewLayout extends StatelessWidget {
  Widget buildTabView(BuildContext context, _Page page) {
    String labelId = page.labelId;
    switch(labelId) {
      case '主页':
      // return HomePage();
      return Container();
      break;
      case '项目':
      return Container();
      break;
      default:
      return Container();
      break;
    }
  }

  @override
  Widget build(BuildContext context, ) {
    LogUtil.e("TabBarViewLayout build.......");
    return TabBarView(
      children: _allPages.map((_Page page) {
        return buildTabView(context, page);
      }).toList(),
    );
  }
}