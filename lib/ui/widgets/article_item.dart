import 'package:flutter/material.dart';
import 'package:hello_flutter/model/models.dart';
import 'package:hello_flutter/ui/widgets/like_btn.dart';

class ArticleItem extends StatelessWidget {
  final ArticleModel model;

  final String labelId;
  final bool isHome;

  ArticleItem(
    this.model, {
    Key key,
    this.labelId,
    this.isHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 10,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    model.desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: <Widget>[
                      LikeBtn(
                        labelId: labelId,
                        id: model.originId?? model.id,
                        isLike: model.collect,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        model.author,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container (
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 12.0),
              child: CircleAvatar(
                radius: 28.0,
                backgroundColor: Colors.white24,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    model.superChapterName ?? '文章',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.33,
            color: Color(0xffe5e5e5),
          )
        ),
      ),
    );
  }
}
