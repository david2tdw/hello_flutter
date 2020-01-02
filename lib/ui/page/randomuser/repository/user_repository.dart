import 'package:hello_flutter/ui/page/randomuser/model/user_response.dart';
import 'package:hello_flutter/ui/page/randomuser/repository/user_api_provider.dart';

class UserRepository{
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser(){
    return _apiProvider.getUser();
  }
}