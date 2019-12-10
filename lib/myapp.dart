import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hello_flutter/ui/page/login/login_page.dart';
import 'package:hello_flutter/ui/page/login/login_two_page.dart';
import 'package:hello_flutter/ui/page/payment/payment_success_page.dart';
import 'package:hello_flutter/ui/page/shopping/product_detail_page.dart';
import 'package:hello_flutter/ui/page/shopping/shopping_details_page.dart';
import 'package:hello_flutter/ui/page/shopping/shopping_one_page.dart';
import 'package:hello_flutter/utils/translations.dart';
import 'package:hello_flutter/utils/uidata.dart';
import 'package:hello_flutter/ui/page/home_page.dart';
import 'package:hello_flutter/ui/page/notfound/notfound_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
    title: UIData.appName,
    theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: UIData.quickFont,
        primarySwatch: Colors.amber),
    debugShowCheckedModeBanner: false,
    showPerformanceOverlay: false,
    home: HomePage(),
    localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", "US"),
        const Locale("hi", "IN"),
      ],
    // routes
    routes: <String, WidgetBuilder>{
      UIData.homeRoute: (BuildContext context) => HomePage(),
      UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
      UIData.shoppingOneRoute: (BuildContext context) => ShoppingOnePage(),
      UIData.shoppingTwoRoute: (BuildContext context) => ShoppingDetailsPage(),
      UIData.shoppingThreeRoute: (BuildContext context) => ProductDetailPage(),
      UIData.loginOneRoute: (BuildContext context) => LoginPage(),
      UIData.loginTwoRoute: (BuildContext context) => LoginTwoPage(),
      UIData.paymentTwoRoute : (BuildContext context) => PaymentSuccessPage(),
    },
    onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
        builder: (context) => new NotFoundPage(
              appTitle: UIData.coming_soon,
              icon: FontAwesomeIcons.solidSmile,
              title: UIData.coming_soon,
              message: "Under Development",
              iconColor: Colors.green,
            )),
  );
  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
