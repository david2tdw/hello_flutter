import 'package:flutter/material.dart';
import 'package:hello_flutter/utils/uidata.dart';

class HomeScene extends StatefulWidget {
  final Widget child;

  HomeScene({Key key, this.child}) : super(key: key);

  @override
  _HomeSceneState createState() => _HomeSceneState();
}

class _HomeSceneState extends State<HomeScene> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text('首页'),
        backgroundColor: UIData.orange,
        //  app bar 阴影
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
