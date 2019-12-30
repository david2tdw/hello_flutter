import 'package:flutter/material.dart';
import 'package:hello_flutter/ui/widgets/progress_view.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('搜索'),),
      body: ProgressView(),
    );
  }
}