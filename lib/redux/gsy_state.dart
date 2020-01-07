import 'package:flutter/material.dart';
import 'package:hello_flutter/model/User.dart';
import 'package:hello_flutter/redux/middleware/epic_middleware.dart';
import 'package:hello_flutter/redux/reducer/login_reducer.dart';
import 'package:hello_flutter/redux/reducer/user_reducer.dart';

import 'package:redux/redux.dart';


class GSYState {
  User userInfo;

  bool login;
  Locale locale;

  GSYState({
    this.userInfo,
    this.login,
    this.locale,
  });


}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
GSYState appReducer(GSYState state, action) {
  return GSYState(
    //通过 UserReducer 将 GSYState 内的 userInfo 和 action 关联在一起
    userInfo: UserReducer(state.userInfo, action),
    login: LoginReducer(state.login, action),
    // locale: LocaleReducer(state.login, action),
  );
}

// 新建的reducer要添加到这个全局的middleware里，否则无法调用
final List<Middleware<GSYState>> middleware = [
  EpicMiddleware<GSYState>(UserInfoEpic()),
  EpicMiddleware<GSYState>(LoginEpic()),
  UserInfoMiddleware(),
  LoginMiddleware(),
];
