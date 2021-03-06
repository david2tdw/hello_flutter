// Toast工具类
import 'package:oktoast/oktoast.dart';

class ToastUtil {
  static show(String msg, {duration = 2000}) {
    if (msg == null) {
      return;
    }
    showToast(
      msg,
      duration: Duration(milliseconds: duration),
      dismissOtherToast: true,
    );
  }

  static cancelToast() {
    dismissAllToast();
  }
}