
import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/data/dao/user_dao.dart';
import 'package:hello_flutter/redux/gsy_state.dart';
import 'package:hello_flutter/redux/middleware/epic.dart';
import 'package:hello_flutter/redux/middleware/epic_store.dart';
import 'package:hello_flutter/utils/navigator_util.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';


final LoginReducer = combineReducers<bool> ([
  TypedReducer<bool, LoginSuccessAction>(_loginResult),
  TypedReducer<bool, LogoutAction> (_logoutResult),
]);


bool _loginResult(bool result, LoginSuccessAction action) {
  if (action.success == true) {
    print("_loginResult success");
    NavigatorUtil.goHome(action.context);
  }
  return action.success;
}

bool _logoutResult (bool result, LogoutAction action) {
  return true;
}

class LoginSuccessAction {
  final BuildContext context;
  final bool success;
  LoginSuccessAction(this.context, this.success);
}

class LogoutAction {
  final BuildContext context;
  LogoutAction(this.context);
}

class LoginAction {
  final BuildContext context;
  final String username;
  final String password;

  LoginAction(this.context, this.username, this.password);
}

class LoginMiddleware implements MiddlewareClass<GSYState> {
  @override
  call(Store<GSYState> store, dynamic action, NextDispatcher next) {
    if (action is LogoutAction) {
      UserDao.clearAll(store);
      NavigatorUtil.goHome(action.context);
    }
    next(action);
    print('444');
  }
}

class LoginEpic implements EpicClass<GSYState>{
  @override
  Stream call(Stream<dynamic> actions, EpicStore<GSYState> store) {
    return Observable(actions)
    .whereType<LoginAction>()
    .switchMap((action) => _loginIn(action, store));
  }

  Stream<dynamic> _loginIn(LoginAction action, EpicStore<GSYState> store) async* {
    print('_loginIn');
    var res = await UserDao.login(
      action.username.trim(), action.password.trim(), store
    );
    // 返回上一个页面
    Navigator.pop(action.context);
    yield LoginSuccessAction(action.context, (res != null && res.result));
  }
}