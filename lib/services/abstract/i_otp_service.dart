import 'package:hello_flutter/model/login.dart';
import 'package:hello_flutter/model/otp.dart';
import 'package:hello_flutter/services/network_service_response.dart';

abstract class IOTPService {
  Future<NetworkServieResponse<CreateOTPResponse>> createOTP(String phoneNumber);
  Future<NetworkServieResponse<OTPResponse>> fetchOTPLoginResponse(Login userLogin);
}