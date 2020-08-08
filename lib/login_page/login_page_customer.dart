
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/Animation/FadeAnimation.dart';
import 'package:srmdot/dashboard/choose_location.dart';
import 'package:srmdot/dashboard/loading_page.dart';
import 'package:srmdot/sign_up_page/sign_up_page_customer.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPageCustomer extends StatefulWidget {
  static String id = 'login_page_customer';

  @override
  _LoginPageCustomerState createState() => _LoginPageCustomerState();
}

class _LoginPageCustomerState extends State<LoginPageCustomer> {
  bool isHidden = true;
  String error = '';

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  String email;
  String password;
  final userPool = new CognitoUserPool(
    'ap-south-1_vJl7jtWLM',
    '6t4ama2lc5923jvhmkt4ghe9fh',
  );


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
            SizedBox(
              width: double.infinity,
              child: Text(
                '$error'
              ),
            ),
            showAlert(),
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
                        FadeAnimation(
                          1.2,
                          TextField(
                            decoration: InputDecoration(
                                hintText: "User Name",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 1.5),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 2.5),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                                ),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black54,
                                )),
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        FadeAnimation(
                          1.2,
                          TextField(
                            obscureText: isHidden == true ? true : false,
                            decoration: InputDecoration(

                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 1.5),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepOrange, width: 2.5),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                                ),
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.black54,
                              ),
                              suffixIcon: IconButton(
                                color: Colors.black,
                                onPressed: toggleVisibility,
                                icon: isHidden
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                              ),),
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ),
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
                            onPressed: () async{


                              final cognitoUser = new CognitoUser(email, userPool);
                              final authDetails = new AuthenticationDetails(
                                username: email,
                                password: password,
                              );
                              CognitoUserSession session;
                              try {
                                session = await cognitoUser.authenticateUser(authDetails);
                                print('success');
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: ChooseLocation())
                                );
                              }on CognitoUserNewPasswordRequiredException catch (e) {
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Error Occured",
                                  desc: "Please ensure that the username and password is correct",

                                ).show();
                                print(e);
                              } on CognitoUserMfaRequiredException catch (e) {
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Error Occured",
                                  desc: "Please ensure that the username and password is correct",

                                ).show();
                                print(e);
                                // handle SMS_MFA challenge
                              } on CognitoUserSelectMfaTypeException catch (e) {
                                print(e);
                                // handle SELECT_MFA_TYPE challenge
                              } on CognitoUserMfaSetupException catch (e) {
                                print(e);
                                // handle MFA_SETUP challenge
                              } on CognitoUserTotpRequiredException catch (e) {
                                print(e);
                                // handle SOFTWARE_TOKEN_MFA challenge
                              } on CognitoUserCustomChallengeException catch (e) {
                                print(e);
                                // handle CUSTOM_CHALLENGE challenge
                              } on CognitoUserConfirmationNecessaryException catch (e) {
                                print(e);
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        child: ChooseLocation())
                                );
                                // handle User Confirmation Necessary
                              } on CognitoClientException catch (e) {
                                print(e);
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Error Occured",
                                  desc: "Please ensure that the username and password is correct",

                                ).show();
                                // handle Wrong Username and Password and Cognito Client
                              } catch (e) {


                                error = 'Error Occured';
                                print(e);
                              }
                              print(session.getAccessToken().getJwtToken());
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
                                      child: SignUpPageCustomer()));
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
         hintText == 'Email' ? email : password = value;
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
  Widget showAlert(){
    if(error != ''){
      return Container(
        color: Colors.red,
        width: double.infinity,
        child: Text(error,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
  }
    return SizedBox(height: 0,);
  }
}

