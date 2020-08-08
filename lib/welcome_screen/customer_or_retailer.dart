import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/Animation/FadeAnimation.dart';
import 'package:srmdot/login_page/login_page_customer.dart';
import 'package:srmdot/sign_up_page/sign_up_page_customer.dart';
import 'package:srmdot/welcome_screen/welcome_screen.dart';

class CustomerOrRetailer extends StatefulWidget {
  static String id = 'customer_or_retailer';
  @override
  _CustomerOrRetailerState createState() => _CustomerOrRetailerState();
}

class _CustomerOrRetailerState extends State<CustomerOrRetailer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(255, 123, 67, 1.0),
            Color.fromRGBO(245, 50, 111, 1.0)
          ])),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Lorem Ipsum",
                        style: TextStyle(
                            fontFamily: 'Gotu',
                            letterSpacing: 2.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      )),
                ],
              ),
              FadeAnimation(
                  1.4,
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/illustration2.png'))),
                  )),
              Column(
                children: <Widget>[
                  FadeAnimation(
                    1.5,
                    Container(
                      height: 55,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: WelcomeScreen(isRetailer: false)));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 260.0, minHeight: 60.0),
                            alignment: Alignment.center,
                            child: Text(
                              "I am a Customer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FadeAnimation(
                    1.5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            width: 120,
                            height: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "OR",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            width: 120,
                            height: 1.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  FadeAnimation(
                    1.6,
                    Container(
                      height: 55,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: WelcomeScreen(isRetailer: true)));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.all(0),
                        child: Ink(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 260.0, minHeight: 60.0),
                            alignment: Alignment.center,
                            child: Text(
                              "I am a Retailer",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
