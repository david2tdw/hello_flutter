import 'package:flutter/material.dart';
import 'package:hello_flutter/di/dependency_injection.dart';
import 'package:hello_flutter/myapp-redux.dart';
// import 'package:hello_flutter/myapp.dart';

void main() {
  Injector.configure(Flavor.MOCK);
  // runApp(MyApp());
  runApp(FlutterReduxApp());
}