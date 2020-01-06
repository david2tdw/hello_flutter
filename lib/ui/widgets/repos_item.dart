import 'package:flutter/material.dart';
import 'package:hello_flutter/model/ReposViewModel.dart';
import 'package:hello_flutter/ui/widgets/gsy_card_item.dart';
import 'package:hello_flutter/ui/widgets/gsy_icon_text.dart';
import 'package:hello_flutter/utils/uidata.dart';

class ReposItem extends StatelessWidget {
  final ReposViewModel reposViewModel;
  final VoidCallback onPressed;

  ReposItem(this.reposViewModel, {this.onPressed}) : super();

  //仓库item的底部状态，比如star数量等
  _getBottomItem(BuildContext context, IconData icon, String text,
      {int flex = 3}) {
    return new Expanded(
      flex: flex,
      child: new Center(
        child: GSYIConText(
          icon,
          text,
          TextStyle(color: Color(0xff959595), fontSize: 14.0),
          Color(0xff959595),
          15.0,
          padding: 5.0,
          textWidth: flex == 4
              ? (MediaQuery.of(context).size.width - 100) / 3
              : (MediaQuery.of(context).size.width - 100) / 5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GSYCardItem(
        child: FlatButton(
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 0.0,
              top: 10.0,
              right: 10.0,
              bottom: 10.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //仓库名
                          Text(
                            reposViewModel.repositoryName ?? "",
                            style: TextStyle(
                              color: Color(0xFF121917),
                              fontSize: 18.0,
                            ),
                          ),
                          //用户名
                          GSYIConText(
                            const IconData(0xe63e,
                                fontFamily: UIData.FONT_FAMILY),
                            reposViewModel.ownerName,
                            TextStyle(
                              color: Color(0xffc4c4c4),
                              fontSize: 14.0,
                            ),
                            Color(0xffc4c4c4),
                            10.0,
                            padding: 3.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              _getBottomItem(
                                  context,
                                  const IconData(
                                    0xe643,
                                    fontFamily: UIData.FONT_FAMILY,
                                  ),
                                  reposViewModel.repositoryStar),
                              SizedBox(
                                width: 5.0,
                              ),
                              _getBottomItem(
                                  context,
                                  const IconData(
                                    0xe661,
                                    fontFamily: UIData.FONT_FAMILY,
                                  ),
                                  reposViewModel.repositoryWatch,
                                  flex: 4)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
