import 'package:flutter/material.dart';

class LikeBtn extends StatelessWidget {
  final String labelId;
  final int id;
  final bool isLike;

  LikeBtn({
    Key key,
    this.labelId,
    this.id,
    this.isLike,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Icon(
        Icons.favorite,
        color: (isLike == true) ? Colors.redAccent : Color(0xFF999999),
      ),
    );
  }
}