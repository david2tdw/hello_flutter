import 'package:flutter/cupertino.dart';

class LoginProvider extends InheritedWidget {
  final Function validationErrorCallback;
  final Widget child;

  LoginProvider({
    this.validationErrorCallback,
    this.child
  });

  static LoginProvider of(BuildContext context) => context.inheritFromWidgetOfExactType(LoginProvider);

  @override
  bool updateShouldNotify(LoginProvider oldWidget) {
    return validationErrorCallback != oldWidget.validationErrorCallback;
  }

  
}