import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:srmdot/dashboard/add_item_page.dart';
import 'package:srmdot/dashboard/choose_location.dart';
import 'package:srmdot/dashboard/dashboard.dart';
import 'package:srmdot/item_info/item_info.dart';
import 'package:srmdot/login_page/login_page_customer.dart';
import 'package:srmdot/login_page/login_page_retailer.dart';
import 'package:srmdot/show_orders/show_orders.dart';
import 'package:srmdot/sign_up_page/sign_up_page_customer.dart';
import 'package:srmdot/sign_up_page/sign_up_page_retailer.dart';
import 'package:srmdot/splash_screen/splash_screen.dart';
import 'package:srmdot/welcome_screen/customer_or_retailer.dart';
import 'package:srmdot/welcome_screen/welcome_screen.dart';
import 'package:srmdot/Analysis/Analysis.dart';
import 'package:srmdot/sign_up_page/verification.dart';
import 'iPhoneXXS11Pro1.dart';
import 'iPhoneXXS11Pro2.dart';
import 'iPhoneXXS11Pro3.dart';
import 'iPhoneXXS11Pro4.dart';
import 'iPhoneXXS11Pro5.dart';
import 'dashboard/qr_code_scanner.dart';
import 'Running_low/Running_low.dart';
import 'package:srmdot/Connect/Connect.dart';
import 'package:srmdot/Connect/QRscan.dart';
import 'package:srmdot/dashboard/Feed.dart';
import 'package:srmdot/screens/home_screen.dart';
import 'package:srmdot/screens/chat_screen.dart';
import 'package:srmdot/Profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          CustomerOrRetailer.id: (context) => CustomerOrRetailer(),
          SignUpPageCustomer.id: (context) => SignUpPageCustomer(),
          Verification.id: (context) => Verification(),
          LoginPageCustomer.id: (context) => LoginPageCustomer(),
          SignUpPageRetailer.id: (context) => SignUpPageRetailer(),
          LoginPageRetailer.id: (context) => LoginPageRetailer(),
          ChooseLocation.id: (context) => ChooseLocation(),
          Dashboard.id: (context) => Dashboard(),
          ShowOrders.id: (context) => ShowOrders(),
          AddItemPage.id: (context) => AddItemPage(),
          QrCodeScanner.id: (context) => QrCodeScanner(),
          ItemInfo.id: (context) => ItemInfo(),
          Analysis.id: (context) => Analysis(),
          iPhoneXXS11Pro1.id: (context) => iPhoneXXS11Pro1(),
          iPhoneXXS11Pro2.id: (context) => iPhoneXXS11Pro2(),
          iPhoneXXS11Pro3.id: (context) => iPhoneXXS11Pro3(),
          iPhoneXXS11Pro4.id: (context) => iPhoneXXS11Pro4(),
          iPhoneXXS11Pro5.id: (context) => iPhoneXXS11Pro5(),
          Running_low.id: (context) => Running_low(),
          ConnectPage.id: (context) => ConnectPage(),
          QrScan.id: (context) => QrScan(),
          FeedPage.id: (context) => FeedPage(),
          Inbox.id: (context) => Inbox(),
          ChatScreen.id: (context) => ChatScreen(),
          MyProfile.id: (context) => MyProfile(),
        });
  }
}




