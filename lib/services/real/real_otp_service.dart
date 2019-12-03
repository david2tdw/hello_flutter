import 'package:hello_flutter/model/login.dart';
import 'package:hello_flutter/model/otp.dart';
import 'package:hello_flutter/services/abstract/i_otp_service.dart';
import 'package:hello_flutter/services/network_service.dart';
import 'package:hello_flutter/services/network_service_response.dart';
import 'package:hello_flutter/services/restclient.dart';


class OTPService extends NetworkService implements IOTPService {
  static const _kCreateOtpUrl = "/createOtpForUser/{1}";
  static const _kUserOtpLogin ="/userotplogin";

  OTPService(RestClient rest) : super(rest);
  

  @override
  Future<NetworkServieResponse<CreateOTPResponse>> createOTP(String phoneNumber) async{
    var result  = await rest.getAsync<CreateOTPResponse>(
      Uri.parse(_kCreateOtpUrl.replaceFirst("{1}", phoneNumber)).toString()
    );

    if (result.mappedResult != null) {
      var res = CreateOTPResponse.fromJson(result.mappedResult);
      return new NetworkServieResponse(
        content: res,
        success: result.networkServieResponse.success
      );
    }
    return new NetworkServieResponse(
      success: result.networkServieResponse.success,
      message: result.networkServieResponse.message
    );
  }

  @override
  Future<NetworkServieResponse<OTPResponse>> fetchOTPLoginResponse(Login userLogin) async {
    var result  = await rest.postAsync<OTPResponse>(_kUserOtpLogin, userLogin);
    if (result.mappedResult != null) {
      var res = OTPResponse.fromJson(result.mappedResult);
      return new NetworkServieResponse(
        content:res,
        success: result.networkServieResponse.success,
      );
    }
    return new NetworkServieResponse(
      success: result.networkServieResponse.success,
      message: result.networkServieResponse.message
    );
  }

}