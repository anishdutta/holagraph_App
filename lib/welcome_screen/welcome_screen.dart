import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/Animation/FadeAnimation.dart';
import 'package:srmdot/login_page/login_page_customer.dart';
import 'package:srmdot/login_page/login_page_retailer.dart';
import 'package:srmdot/sign_up_page/sign_up_page_customer.dart';
import 'package:srmdot/sign_up_page/sign_up_page_retailer.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';
  bool isRetailer;

  WelcomeScreen({this.isRetailer});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromRGBO(17, 153, 142, 1.0),
            Color.fromRGBO(56, 239, 125, 1.0)
          ])),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "holagraph",
                        style: TextStyle(
                            fontFamily: 'LexendGiga',
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                            fontSize: 35),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.2,
                      Text(
                        "everything you need need to turbocharge your career",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Pacifino',
                            color: Colors.white,
                            fontSize: 18,
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              FadeAnimation(
                  1.4,
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/welcome.png'))),
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
                                      child: LoginPageRetailer())
                         );

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
                              "Login",
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
                    height: 20,
                  ),
                  FadeAnimation(
                    1.6,
                    Container(
                      height: 55,
                      child: RaisedButton(
                        onPressed: () {
                          isRetailer == false
                              ? Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: SignUpPageCustomer()))
                              : Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: SignUpPageRetailer()));
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
                              "Sign Up",
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
