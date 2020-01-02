import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/page/blocarch/bloc_provider.dart';
import 'package:hello_flutter/ui/page/blocarch/bloc_provider.dart';
import 'package:hello_flutter/ui/page/blocarch/model/SearchModel.dart';
import 'package:hello_flutter/ui/page/blocarch/model/item_model.dart';
// https://github.com/jiang111/flutter_bloc_architecture_demo

class BlocArch extends StatefulWidget {
  @override
  _BlocArchState createState() => _BlocArchState();
}

class _BlocArchState extends State<BlocArch> {
  BlocProvider _blocProvider = BlocProvider.newInstance();

  @override
  void initState() {
    super.initState();
    _blocProvider.fetchQueryList();
  }

  @override
  void dispose() {
    _blocProvider.dispose();
    super.dispose();
  }

  void finished() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Sample"),
      ),
      body: buildBody(),
    );
  }

  Widget buildData() {
    return _blocProvider.streamBuilder<SearchModel>(
        success: (data) {
          return buildList(data);
        },
        error: (msg) {
          return Container(
            child: Center(
              child: Text(msg),
            ),
          );
        },
        empty: () {
          return Container(
            child: Center(
              child: Text("暂无数据"),
            ),
          );
        },
        loading: () {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        finished: finished);
  }

  Widget buildList(SearchModel data) {
    return ListView.builder(
      itemCount: data.items.length,
      itemBuilder: (context, index) {
        ItemModel itemModel = data.items[index];
        return InkWell(
          onTap: () {},
          child: Card(
            margin: EdgeInsets.only(
              left: 15.0,
              top: 15.0,
              right: 15.0,
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 10.0,
                  ),
                  child: Text(itemModel.name,
                      style: TextStyle(
                        color: Color(0xff333333),
                        fontSize: 18.0,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: Text(
                    itemModel.description,
                    style: TextStyle(
                      color: Color(0xff9b9b9b),
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                        ),
                        child: Text("size:${itemModel.size}",
                            style: TextStyle(
                              color: Color(0xff9b9b9b),
                              fontSize: 14.0,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                        ),
                        child: Text("forks:${itemModel.forks}",
                            style: TextStyle(
                              color: Color(0xff9b9b9b),
                              fontSize: 14.0,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBody() {
    return buildData();
  }
}
