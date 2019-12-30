import 'package:common_utils/common_utils.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static bool isLogin() {
    return ObjectUtil.isNotEmpty("app_token");
  }
}
