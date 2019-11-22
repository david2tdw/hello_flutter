

import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  final appTitle;
  final title;
  final message;
  final IconData icon;
  final String image;
  final iconColor;

  NotFoundPage({
    this.appTitle = 'search',
    this.title = 'No Result',
    this.message = 'Try a more general keyword.',
    this.icon = Icons.search,
    this.image,
    this.iconColor = Colors.black
  });

  Widget bodyData() => Center();
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}