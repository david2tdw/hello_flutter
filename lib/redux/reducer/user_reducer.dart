import 'package:hello_flutter/data/dao/user_dao.dart';
import 'package:hello_flutter/model/User.dart';
import 'package:hello_flutter/redux/gsy_state.dart';
import 'package:hello_flutter/redux/middleware/epic.dart';
import 'package:hello_flutter/redux/middleware/epic_store.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';


// redux 的 combineReducers, 通过 TypedReducer 将 UpdateUserAction 与 reducers 关联起来
final UserReducer = combineReducers<User> ([
  TypedReducer<User, UpdateUserAction>(_updateLoaded),
]);

User _updateLoaded(User user, action) {
  user = action.userInfo;
  return user;
}

class UpdateUserAction {
  final User userInfo;
  UpdateUserAction(this.userInfo);
}

class UserInfoMiddleware implements MiddlewareClass<GSYState> {
  @override
  call(Store<GSYState> store, dynamic action, NextDispatcher next) {
    if (action is UpdateUserAction) {
      print("*********** UserInfoMiddleware *********** ");
    }
    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }

}


class UserInfoEpic implements EpicClass<GSYState> {
  @override
  Stream call(Stream<dynamic> actions, EpicStore<GSYState> store) {
    return Observable(actions).whereType<FetchUserAction>().debounce((_) => TimerStream(true, const Duration(microseconds: 10))).switchMap((action) => _loadUserInfo());
  }

}

Stream<dynamic> _loadUserInfo() async* {
  print("*********** userInfoEpic _loadUserInfo ***********");
  var res = await UserDao.getUserInfo(null);
  yield UpdateUserAction(res.data);
}
class FetchUserAction {}