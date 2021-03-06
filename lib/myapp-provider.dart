import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hello_flutter/deer/page/deer_home_page.dart';
import 'package:hello_flutter/deer/provider/theme_provider.dart';
import 'package:hello_flutter/ui/page/blocarch/bloc_arch.dart';
import 'package:hello_flutter/ui/page/dashboard/dashboard_one/dashboard_one_page.dart';
import 'package:hello_flutter/ui/page/dashboard/dashboard_two/dashboard_two_page.dart';
import 'package:hello_flutter/ui/page/douban/home_scene.dart';
import 'package:hello_flutter/ui/page/home_page.dart';
import 'package:hello_flutter/ui/page/login/login_page.dart';
import 'package:hello_flutter/ui/page/login/login_two_page.dart';
import 'package:hello_flutter/ui/page/notfound/notfound_page.dart';
import 'package:hello_flutter/ui/page/payment/credit_card_page.dart';
import 'package:hello_flutter/ui/page/payment/payment_success_page.dart';
import 'package:hello_flutter/ui/page/profile/profile_one_page.dart';
import 'package:hello_flutter/ui/page/profile/profile_two_page.dart';
import 'package:hello_flutter/ui/page/randomuser/ui/user_widget.dart';
import 'package:hello_flutter/ui/page/settings/setting_one_page.dart';
import 'package:hello_flutter/ui/page/shopping/product_detail_page.dart';
import 'package:hello_flutter/ui/page/shopping/shopping_details_page.dart';
import 'package:hello_flutter/ui/page/shopping/shopping_one_page.dart';
import 'package:hello_flutter/ui/page/timeline/timeline_one_page.dart';
import 'package:hello_flutter/ui/page/timeline/timeline_two_page.dart';
import 'package:hello_flutter/ui/page/trending/trend_page.dart';
import 'package:hello_flutter/utils/translations.dart';
import 'package:hello_flutter/utils/uidata.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

class MyAppProvider extends StatelessWidget {
  


  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ChangeNotifierProvider<ThemeProvider>(
        // 创建一个Provider
        create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, provider, widget) {
            return MaterialApp(
              title: UIData.appName,
    // theme: ThemeData(
    //   primaryColor: Colors.black,
    //   fontFamily: UIData.quickFont,
    //   primarySwatch: Colors.amber,
    //   textTheme: TextTheme(
    //       title: TextStyle(fontSize: 30, color: Colors.redAccent),
    //       subtitle: TextStyle(fontSize: 20, color: Colors.white),
    //       body1: TextStyle(fontSize: 15, color: Colors.white)),
    // ),
    theme: provider.getTheme(),
    darkTheme: provider.getTheme(isDarkMode: true),

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
    // uidata.dart, menu_view_model.dart
    routes: <String, WidgetBuilder>{
      UIData.homeRoute: (BuildContext context) => HomePage(),
      UIData.profileOneRoute: (BuildContext context) => ProfileOnePage(),
      UIData.profileTwoRoute: (BuildContext context) => ProfileTwoPage(),
      UIData.notFoundRoute: (BuildContext context) => NotFoundPage(),
      UIData.shoppingOneRoute: (BuildContext context) => ShoppingOnePage(),
      UIData.shoppingTwoRoute: (BuildContext context) => ShoppingDetailsPage(),
      UIData.shoppingThreeRoute: (BuildContext context) => ProductDetailPage(),
      UIData.loginOneRoute: (BuildContext context) => LoginPage(),
      UIData.loginTwoRoute: (BuildContext context) => LoginTwoPage(),
      UIData.timelineOneRoute: (BuildContext context) => TimelineOnePage(),
      UIData.timelineTwoRoute: (BuildContext context) => TimelineTwoPage(),
      UIData.dashboardOneRoute: (BuildContext context) => DashboardOnePage(),
      UIData.dashboardTwoRoute: (BuildContext context) => DashBoardTwoPage(),
      UIData.settingsOneRoute: (BuildContext context) => SettingsOnePage(),
      UIData.paymentOneRoute: (BuildContext context) => CreditCardPage(),
      UIData.paymentTwoRoute: (BuildContext context) => PaymentSuccessPage(),
      UIData.doubanHome: (BuildContext context) => HomeScene(),
      // UIData.wanAndroidHome: (BuildContext context) => WanMainPage(),

      // UIData.wanAndroidHome: (BuildContext context) => WanHomePageNew(),
      UIData.blocArch: (BuildContext context) => BlocArch(),
      UIData.randomUser: (BuildContext context) => UserWidget(),
      UIData.gsyTrending: (BuildContext context) => TrendPage(),
    
      UIData.deerHome: (BuildContext context) => DeerHomePage(),

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
          },
        ),
      ),
      /// Toast 配置
      backgroundColor:  Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      position: ToastPosition.bottom,
    );
  }}