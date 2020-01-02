import 'package:hello_flutter/ui/page/randomuser/model/user_response.dart';
import 'package:hello_flutter/ui/page/randomuser/repository/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final UserRepository _repository = UserRepository();
  // BehaviorSubject提供的类似Dart的 StreamController, 缓存数据 
  final BehaviorSubject<UserResponse> _subject =
      BehaviorSubject<UserResponse>();

  getUser() async {
    UserResponse response = await _repository.getUser();
    // https://cloud.tencent.com/developer/article/1345645
    // sinks -> bloc -> streams
    print('getUser:' + response.results.toString());
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;

}
final bloc = UserBloc();