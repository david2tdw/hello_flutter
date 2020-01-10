import 'package:flutter/material.dart';
import 'package:hello_flutter/deer/res/gaps.dart';
import 'package:hello_flutter/deer/util/theme_utils.dart';
import 'package:hello_flutter/deer/widgets/load_asset_image.dart';
import 'package:hello_flutter/deer/widgets/my_card.dart';

class OrderItemTag extends StatelessWidget {
  final String date;
  final int orderTotal;

  const OrderItemTag({
    Key key,
    @required this.date,
    @required this.orderTotal,
  }): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: MyCard(
        child: Container(
          height: 34.0,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            children: <Widget>[
              ThemeUtils.isDark(context)? const LoadAssetImage('order/icon_calendar_dark',
              width: 14.0,
              height: 14.0,
              ) :
              const LoadAssetImage('order/icon_calendar',
              width: 14.0,
              height: 14.0,),
              Gaps.hGap10,
              Text(date),
              Expanded(
                child: Gaps.empty,
              ),
              Text('$orderTotal单'),
            ],
          ),
        ),
      ),
    );
  }
}