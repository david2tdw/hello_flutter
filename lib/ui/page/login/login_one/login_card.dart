import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hello_flutter/logic/bloc/login_bloc.dart';
import 'package:hello_flutter/model/fetch_process.dart';


class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard>
    with SingleTickerProviderStateMixin {
  var deviceSize;
  AnimationController controller;
  Animation<double> animation;
  LoginBloc loginBloc;
  String phoneNumber, otp;
  StreamSubscription<FetchProcess> apiStreamSubscription;

  Widget loginBuilder() => StreamBuilder<bool>(
        stream: loginBloc.otpResult,
        initialData: false,
        builder: (context, snapshot) => Form(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new TextField(
                  onChanged: (phone) => phoneNumber = phone,
                  enabled: !snapshot.data,
                  style: new TextStyle(fontSize: 15.0, color: Colors.black),
                  decoration: new InputDecoration(
                    hintText: Translations.of(context).text("enter_code_hint"),
                    labelText:
                        Translations.of(context).text("enter_code_label"),
                    labelStyle: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                new SizedBox(
                  height: 10.0,
                )
              ],
            ),
          ),
        )),
      );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
