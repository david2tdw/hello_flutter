import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final Color titleColor;
  final IconData leftIcon;
  final String titleId;
  final String title;
  final String extraId;
  final String extra;
  final IconData rightIcon;
  final GestureTapCallback onTap;

  const HeaderItem({
    this.margin,
      this.titleColor,
      this.leftIcon,
      this.titleId: 'title_repos',
      this.title,
      this.extraId: 'more',
      this.extra,
      this.rightIcon,
      this.onTap,
      Key key
  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      margin: margin?? const EdgeInsets.only(top: 0.0),
      child: ListTile(
        onTap: onTap,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              leftIcon?? Icons.whatshot,
              color: titleColor?? Colors.blueAccent,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                title?? 'biaoti',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: titleColor ?? Colors.blueAccent,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              extra?? 'no value',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            Icon(
              rightIcon?? Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.33,
            color: Color(0xffe5e5e5),
          )
        )
      ),
    );
  }
}