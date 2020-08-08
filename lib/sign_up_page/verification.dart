import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/Animation/FadeAnimation.dart';
import 'sign_up_page_customer.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';


void main() {

  runApp(Verification());
}

class Verification extends StatelessWidget {
  static String id = 'Verification';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final userPool = new CognitoUserPool(
    'ap-south-1_vJl7jtWLM',
    '6t4ama2lc5923jvhmkt4ghe9fh',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: SignUpPageCustomer()
                )
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Container(
          height: 270.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Check Your Inbox! Enter Your OTP!',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
              ),
              SizedBox(
                width: double.infinity,
                height: 35.0,
              ),
              Container(
                width: 300.0,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "SUBMIT OTP HERE!",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 35.0,
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.deepOrange,
                child: MaterialButton(
                  minWidth: 150.0,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () async{
                    final cognitoUser = new CognitoUser('email@inspire.my', userPool);

                    bool registrationConfirmed = false;
                    try {
                      registrationConfirmed = await cognitoUser.confirmRegistration('123456');
                    } catch (e) {
                      print(e);
                    }
                    print(registrationConfirmed);
                  },
                  child: Text(
                    "SUBMIT!",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 25.0,
              ),
              Text(
                'Resend OTP!',
                style: TextStyle(fontSize: 15.0),
              )
            ],
          ),
          margin: EdgeInsets.all(40.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0), //(x,y)
                blurRadius: 9.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
