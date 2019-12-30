import 'package:flutter/cupertino.dart';
// import 'package:hello_flutter/ui/page/wanandroid/user_login_page.dart';

class NavigatorUtil {
  static void pushPage(BuildContext context, Widget page, {String pageName, bool needLogin = false}) {
    if (context == null || page == null) 
    return;
    if (needLogin) {
      // pushPage(context, UserLoginPage());
      print('need login');
      return;
    }
    Navigator.push(context, new CupertinoPageRoute(builder: (ctx) => page));
  }
}