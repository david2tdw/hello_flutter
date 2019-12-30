import 'package:flutter/material.dart';
import 'package:hello_flutter/utils/utils.dart';

class UserLoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Image.asset(
            Utils.getImgPath("ic_login_bg"),
            package: "base_library",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          LoginBody(),
        ],
      ),
    );
  }
}


class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  }
}