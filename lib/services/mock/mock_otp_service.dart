import 'package:hello_flutter/model/login.dart';
import 'package:hello_flutter/model/otp.dart';
import 'package:hello_flutter/services/abstract/i_otp_service.dart';
import 'package:hello_flutter/services/network_service_response.dart';
import 'package:hello_flutter/utils/uidata.dart';

class MockOTPService implements IOTPService {
  @override
  Future<NetworkServieResponse<CreateOTPResponse>> createOTP(
      String phoneNumber) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServieResponse(
      success: true,
      content: null,
    ));
  }

  @override
  Future<NetworkServieResponse<OTPResponse>> fetchOTPLoginResponse(
      Login userLogin) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServieResponse(
        success: true,
        content: kOTPResponse,
        message: UIData.something_went_wrong));
  }
}

var kOTPResponse = new OTPResponse(
    data: const OTPData(authToken: "abcd", userId: "12345"), status: "success");
