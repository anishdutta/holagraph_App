import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/Animation/FadeAnimation.dart';
import 'package:srmdot/dashboard/loading_page.dart';
import 'package:srmdot/sign_up_page/sign_up_page_customer.dart';
import 'package:srmdot/sign_up_page/sign_up_page_retailer.dart';

class LoginPageRetailer extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageRetailerState createState() => _LoginPageRetailerState();
}

class _LoginPageRetailerState extends State<LoginPageRetailer> {
  bool isHidden = true;
  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          1.2,
                          Text(
                            "Login to your account",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[700]),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(1.2, buildTextField("Retailer Email")),
                        SizedBox(height: 20.0),
                        FadeAnimation(1.3, buildTextField("Password")),
                      ],
                    ),
                  ),
                  FadeAnimation(
                      1.4,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          height: 55,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: LoadingPage()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: EdgeInsets.all(0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(255, 123, 67, 1.0),
                                    Color.fromRGBO(245, 50, 111, 1.0)
                                  ]),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 200.0, minHeight: 60.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                  FadeAnimation(
                      1.5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have an account ?  "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: SignUpPageRetailer()));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      onChanged: (value) {
        value = hintText == 'Email' ? email : password;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(13.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 2.5),
          borderRadius: BorderRadius.all(Radius.circular(13.0)),
        ),
        prefixIcon: hintText == "Email"
            ? Icon(
                Icons.email,
                color: Colors.black54,
              )
            : Icon(
                Icons.vpn_key,
                color: Colors.black54,
              ),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: toggleVisibility,
                icon: isHidden
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? isHidden : false,
    );
  }
}
