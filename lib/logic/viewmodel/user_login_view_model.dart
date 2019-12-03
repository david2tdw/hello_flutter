import 'package:flutter/material.dart';
import 'package:hello_flutter/model/login.dart';
import 'package:hello_flutter/model/otp.dart';
import 'package:hello_flutter/services/abstract/i_otp_service.dart';
import 'package:hello_flutter/services/network_service_response.dart';

class UserLoginViewModel {
  String phonenumber;
  String otp;
  bool otpResult = false;
  NetworkServieResponse apiResult;
  IOTPService otpRepo = new Injector().otpService;

  // for otp
  UserLoginViewModel({@required this.phonenumber});

  // for login
  UserLoginViewModel.withTOP({@required this.phonenumber, @required this.otp});

  Future<Null> getTOP(String phoneNumber) async {
    NetworkServieResponse<CreateOTPResponse> result = await otpRepo.createOTP(phonenumber);
    this.otpResult = result.success;
    this.apiResult = result;
  }

  Future<Null> performLogin(UserLoginViewModel userLogin) async {
    NetworkServieResponse<OTPResponse> result = await otpRepo.fetchOTPLoginResponse(Login(
      phonenumber: userLogin.phonenumber,
      otp: userLogin.otp
    ));
    this.apiResult = result;
  }
}