import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/dashboard/loading_page.dart';

class ChooseLocation extends StatefulWidget {
  static String id = 'choose_location';

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  String flareAnimation = 'search_location';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 250.0,
          child: FlareActor(
            'assets/flare/location_pin.flr',
            animation: flareAnimation,
          ),
        ),
        Column(
          children: <Widget>[
            Text(
              'Where do you want us to deliver?',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BalsamiqSans',
                  letterSpacing: 0.5),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.near_me, color: Colors.grey),
                SizedBox(width: 5.0),
                GestureDetector(
                  child: Text(
                    'Use my current location',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade,
                            child: LoadingPage()));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    width: 120,
                    height: 1.3,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    width: 120,
                    height: 1.3,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 5.0),
                GestureDetector(
                  child: Text(
                    'Enter your location',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        )
      ],
    )));
  }
}
