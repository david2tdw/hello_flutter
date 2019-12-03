import 'dart:async';

import 'package:hello_flutter/logic/viewmodel/user_login_view_model.dart';
import 'package:hello_flutter/model/fetch_process.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final otpController = StreamController<UserLoginViewModel>();
  final loginController  = StreamController<UserLoginViewModel>();
  final apiController = BehaviorSubject<FetchProcess>();
  final otpResendController = StreamController<bool>();
  final otpResultController = BehaviorSubject<bool>();
  Sink<UserLoginViewModel> get otpSink => otpController.sink;
  Sink<UserLoginViewModel> get loginSink => otpController.sink;
  Sink<bool> get resnedOtpSink => otpResendController.sink;
  Stream<bool> get otpResult => otpResultController.stream;
  Stream<FetchProcess> get apiResult => apiController.stream;

  LoginBloc() {
    otpController.stream.listen(apiCall);
    otpResendController.stream.listen(resendOtp);
    loginController.stream.listen(apiCall);

  }

  void apiCall (UserLoginViewModel userLogin) async {
    FetchProcess process = new FetchProcess(loading: true);
    //for progress loading
    apiController.add(process);
    if (userLogin.otp == null) {
      process.type = ApiType.performOTP;
      await userLogin.getOtp(userLogin.phonenumber);
    }
  }

  void resendOtp(bool flag) {
    otpResendController.add(false);
  }
}
