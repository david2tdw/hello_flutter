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

  //主页
  static goHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "home");
  }

  //登录页
  static goLogin(BuildContext context){
    Navigator.pushReplacementNamed(context, "login");
  }

  // 返回
  static void goBack(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  // 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }
}
