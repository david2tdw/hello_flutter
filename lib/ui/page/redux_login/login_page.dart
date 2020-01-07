import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hello_flutter/data/config/config.dart';
import 'package:hello_flutter/data/local/local_storage.dart';
import 'package:hello_flutter/logic/bloc/login_bloc.dart';
import 'package:hello_flutter/redux/gsy_state.dart';
import 'package:hello_flutter/redux/reducer/login_reducer.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:gsy_github_app_flutter/redux/gsy_state.dart';
// import 'package:gsy_github_app_flutter/redux/login_redux.dart';

class ReduxLoginPage extends StatefulWidget {
  // 跳转页面名
  static final String sName = "login";

  @override
  State createState() => _ReduxLoginPageState();
}

// 混入 mixins （关键字 with）
// https://juejin.im/post/5c4881dae51d45098e4d96cf
// 添加 analysis_options.yaml配置，允许混入
class _ReduxLoginPageState extends State<ReduxLoginPage> with LoginBLoC {
  @override
  Widget build(BuildContext context) {
    //共享 store
    return new GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: new Center(
              // 防止overFlow的现象
              child: SafeArea(
            // 同时弹出键盘不遮挡
            child: SingleChildScrollView(
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                color: Colors.white,
                margin: const EdgeInsets.only(
                  left: 30.0,
                  top: 40.0,
                  right: 30.0,
                  bottom: 0.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    top: 40.0,
                    right: 30.0,
                    bottom: 0.0,
                  ),
                  //内容
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                      ),
                      //用户名输入框
                      TextField(
                        controller: userController,
                        decoration: InputDecoration(
                          hintText: "请输入用户名",
                          icon: Icon(Icons.person),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                      ),
                      //密码输入框
                      TextField(
                        controller: pwdController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "请输入密码",
                          icon: Icon(Icons.person),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                      ),
                      //登陆按键
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            height: 40,
                            width: constraints.maxWidth,
                            child: FlatButton(
                              textColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                "登陆",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              onPressed: loginIn,
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }
}

abstract class LoginBLoC extends State<ReduxLoginPage> {
  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();

  var _userName = '';
  var _password = '';

  @override
  void initState() {
    super.initState();
    // _initState();
    initParams();
    // userController.text = "hi";
    // controller 添加监听事件
    userController.addListener(_usernameChange);
    pwdController.addListener(_passwordChange);

  }

  @override
  void dispose() {
    super.dispose();
    // controller移除监听事件
    userController.removeListener(_usernameChange);
    pwdController.removeListener(_passwordChange);
  }

  _usernameChange() {
    _userName = userController.text;
  }

  _passwordChange() {
    _password = pwdController.text;
  }

  initParams() async  {
    _userName = await LocalStorage.get(Config.USER_NAME_KEY);
    _password = await LocalStorage.get(Config.PW_KEY);
    userController.value = TextEditingValue(text: _userName ?? "");
    pwdController.value = TextEditingValue(text: _password ?? "");
  }

  // _initState() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _userName = await prefs.get("username");
  //   _password = await prefs.get("password");
  //   // todo TextEditingValue
  //   userController.value = TextEditingValue(text: _userName ?? "");
  //   pwdController.value = TextEditingValue(text: _password ?? '');
  // }

  loginIn() async {
    if (_userName == null || _userName.isEmpty) {
      return;
    }
    if (_password == null || _password.isEmpty) {
      return;
    }
    print('loginIn 123');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", _userName);
    await prefs.setString("password", _password);

    //通过 redux 去执行登陆流程
    StoreProvider.of<GSYState>(context)
        .dispatch(LoginAction(context, _userName, _password));
  }
}
