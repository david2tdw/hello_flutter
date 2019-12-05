import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_flutter/model/fetch_process.dart';
import 'package:hello_flutter/ui/widgets/common_dialog.dart';
import 'package:hello_flutter/utils/uidata.dart';

apiSubscription(Stream<FetchProcess> apiResult, BuildContext context) {
  apiResult.listen((FetchProcess p) {
    if (p.loading) {
      showProgress(context);
    } else {
      hideProgress(context);
      if (p.response.success == false) {
        fetchApiResult(context, p.response);
      } else {
        switch (p.type) {
          case ApiType.performLogin:
            showSuccess(context, UIData.success, FontAwesomeIcons.check);
            break;
          case ApiType.getProductInfo:
            break;
          case ApiType.performOTP:
            break;
        }
      }
    }
  });
}
