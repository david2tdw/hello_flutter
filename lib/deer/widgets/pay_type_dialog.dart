import 'package:flutter/material.dart';
import 'package:hello_flutter/deer/res/dimens.dart';
import 'package:hello_flutter/deer/res/gaps.dart';
import 'package:hello_flutter/deer/widgets/load_asset_image.dart';

class PayTypeDialog extends StatefulWidget {
  final Function(int, String) onPressed;

  PayTypeDialog({
    Key key,
    this.onPressed,
  }): super(key: key);

  @override
  _PayTypeDialogState createState() => _PayTypeDialogState();
}

class _PayTypeDialogState extends State<PayTypeDialog> {
  int _value = 0;

  var _list= ['未收款', '支付宝', '微信', '现金'];

  Widget getItem(int index) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: SizedBox(
          height: 42.0,
          child: Row(
            children: <Widget>[
              Gaps.hGap16,
              Expanded(
                child: Text(
                  _list[index],
                  style: _value == index ? TextStyle(
                    fontSize: Dimens.font_sp14,
                    color: Theme.of(context).primaryColor,
                  ): null,
                ),
              ),
              Offstage(
                offstage: _value != index,
                child: const LoadAssetImage(
                  'order/ic_check',
                  width: 16.0,
                  height: 16.0,
                ),
              ),
              Gaps.hGap16,
            ],
          ),
        ),
        onTap: () {
          if (mounted) {
            setState(() {
              _value = index;
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}