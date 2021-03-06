import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:hello_flutter/deer/common/constant.dart';
import 'package:hello_flutter/deer/res/colors.dart';
import 'package:hello_flutter/deer/res/dimens.dart';
import 'package:hello_flutter/deer/res/gaps.dart';
import 'package:hello_flutter/deer/res/styles.dart';
import 'package:hello_flutter/deer/util/theme_utils.dart';
import 'package:hello_flutter/deer/util/toast_util.dart';
import 'package:hello_flutter/deer/util/utils.dart';
import 'package:hello_flutter/deer/widgets/my_card.dart';
import 'package:hello_flutter/deer/widgets/order_item_button.dart';
import 'package:hello_flutter/deer/widgets/pay_type_dialog.dart';
import 'package:hello_flutter/utils/navigator_util.dart';

class OrderItem extends StatelessWidget {
  final int tabIndex;
  final int index;

  const OrderItem({
    Key key,
    @required this.tabIndex,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle vTextStyle =
        Theme.of(context).textTheme.body1.copyWith(fontSize: Dimens.font_sp12);
    bool isDark = ThemeUtils.isDark(context);
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      child: MyCard(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('15000000000（郭李）'),
                    ),
                    Text(
                      '货到付款',
                      style: TextStyle(
                          fontSize: Dimens.font_sp12,
                          color: Theme.of(context).errorColor),
                    ),
                  ],
                ),
                Gaps.vGap8,
                Text(
                  '西安市雁塔区 鱼化寨街道唐兴路唐兴数码3楼318',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                Gaps.vGap8,
                Gaps.line,
                Gaps.vGap8,
                RichText(
                  text: TextSpan(style: vTextStyle, children: <TextSpan>[
                    TextSpan(text: '清凉一度抽纸'),
                    TextSpan(
                      text: '  x1',
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ]),
                ),
                Gaps.vGap8,
                RichText(
                  text: TextSpan(style: vTextStyle, children: <TextSpan>[
                    TextSpan(text: '清凉一度抽纸'),
                    TextSpan(
                      text: '  x2',
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ]),
                ),
                Gaps.vGap12,
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: vTextStyle,
                          children: <TextSpan>[
                            TextSpan(
                                text: Utils.formatPrice(
                              '20.00',
                              format: MoneyFormat.NORMAL,
                            )),
                            TextSpan(
                                text: '  共3件商品',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle
                                    .copyWith(
                                      fontSize: Dimens.font_sp10,
                                    )),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      '2018.02.05 10:00',
                      style: TextStyles.textSize12,
                    ),
                  ],
                ),
                Gaps.vGap8,
                Gaps.line,
                Gaps.vGap8,
                Row(
                  children: <Widget>[
                    OrderItemButton(
                      key: Key('order_button_1_$index'),
                      text: '联系客户',
                      textColor: isDark ? Colours.dark_text : Colours.text,
                      bgColor:
                          isDark ? Colours.dark_material_bg : Colours.bg_gray,
                      onTap: () => _showCallPhoneDialog(context, '15000000000'),
                    ),
                    Expanded(
                      child: Gaps.empty,
                    ),
                    OrderItemButton(
                      key: Key('order_button_2_$index'),
                      text: Constant.orderLeftButtonText[tabIndex],
                      textColor: isDark ? Colours.dark_text : Colours.text,
                      bgColor:
                          isDark ? Colours.dark_material_bg : Colours.bg_gray,
                      onTap: () {
                        if (tabIndex >= 2) {
                          print('go to orderTrackPage');
                        }
                      },
                    ),
                    Constant.orderRightButtonText[tabIndex].length == 0
                        ? Gaps.empty
                        : Gaps.hGap10,
                    Constant.orderRightButtonText[tabIndex].length == 0
                        ? Gaps.empty
                        : OrderItemButton(
                            key: Key('order_button_3_$index'),
                            text: Constant.orderRightButtonText[tabIndex],
                            textColor: isDark
                                ? Colours.dark_button_text
                                : Colors.white,
                            bgColor: isDark
                                ? Colours.dark_app_main
                                : Colours.app_main,
                            onTap: () {
                              if (tabIndex == 2) {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return PayTypeDialog(
                                      onPressed: (index, type) {
                                        ToastUtil.show('收款类型：$type');
                                      },
                                    );
                                  },
                                );
                              }
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCallPhoneDialog(BuildContext context, String phone) {
    showDialog(
        context: context,
        barrierDismissible: false, // ?
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('提示'),
            content: Text('是否拨打：$phone ?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => NavigatorUtil.goBack(context),
                child: const Text('取消'),
              ),
              FlatButton(
                onPressed: () {
                  Utils.launchTelURL(phone);
                  NavigatorUtil.goBack(context);
                },
                textColor: Theme.of(context).errorColor,
                child: const Text('拨打'),
              ),
            ],
          );
        });
  }
}
