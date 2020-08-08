import 'dart:async';
import 'package:flutter/material.dart';
import 'package:srmdot/welcome_screen/customer_or_retailer.dart';
import 'package:srmdot/welcome_screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 160.0,
              child: Image.asset("assets/images/logo  done.png"),
            ),
//            SizedBox(
//              height: 50.0,
//            ),
//            CircularProgressIndicator(
//              backgroundColor: Colors.white,
//              strokeWidth: 3.5,
//            ),
          ],
        ),
      ),
    );
  }
}
