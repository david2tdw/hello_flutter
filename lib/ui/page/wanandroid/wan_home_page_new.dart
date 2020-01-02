import 'package:flutter/material.dart';
import 'package:hello_flutter/logic/bloc/wan_bloc.dart';
import 'package:hello_flutter/logic/viewmodel/wan_view_model.dart';
import 'package:hello_flutter/model/models.dart';
import 'package:hello_flutter/ui/widgets/article_item.dart';

class WanHomePageNew extends StatefulWidget {
  WanHomePageNew();

  @override
  _WanHomePageNewState createState() => _WanHomePageNewState();
}

class _WanHomePageNewState extends State<WanHomePageNew> {
  ScrollController scrollController;
  WanBloc wanBloc;

  Widget bodyData() {
    print('bodyData:r'+ wanBloc.articleItems.toString());
    // 要渲染的子对象数据列表
    return StreamBuilder<List<ArticleModel>> (
      stream: wanBloc.articleItems,
      builder: (context, snapshot) {
        print('xxxxxxxxxxxxxxxx:' + snapshot.data.toString());
        return snapshot.data[0].id != null ? bodyList(snapshot.data) : Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
  Widget bodyList(List<ArticleModel> articles) => ListView.builder(
    controller: scrollController, 
    itemBuilder: (context, i) {
      print('bbb:' + articles[i].toString());
      return ArticleItem(
        articles[i],
        isHome: true,
      );
    },
  );
  @override
  void initState() {
    super.initState();
    wanBloc = new WanBloc();
    // wanBloc.getArticle();
    wanBloc.getBanner();
    // setState(() {
    //   bannerList: wa
    // });
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        centerTitle: true,
        title: Text('wan android'),
      ),
      body: bodyData(),
    );
  }
}