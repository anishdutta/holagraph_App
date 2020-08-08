import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/dashboard/dashboard.dart';
import 'package:srmdot/dashboard/Feed.dart';

class LoadingPage extends StatefulWidget {
  static String id = 'loading_page';
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String loadingAnimation = 'loading';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.fade, child: FeedPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 140.0,
              child: FlareActor(
                'assets/flare/Loading future circle.flr',
                animation: loadingAnimation,
              ),
            )
          ],
        ),
      ),
    );
  }
}

///////////////////////////
