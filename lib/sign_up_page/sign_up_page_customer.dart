import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/Animation/FadeAnimation.dart';
import 'package:srmdot/constants.dart';
import 'package:srmdot/login_page/login_page_customer.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'verification.dart';
import 'package:rflutter_alert/rflutter_alert.dart';



class SignUpPageCustomer extends StatefulWidget {
  static String id = 'sign_in_page';
  @override
  _SignUpPageCustomerState createState() => _SignUpPageCustomerState();
}

class _SignUpPageCustomerState extends State<SignUpPageCustomer> {
   String username;
   String email;
   String password;
   String contact;
   String address;
   String state;
   String city;
   String Otp;
   String sucess = '';

  bool isHidden = true;

  void toggleVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }
  final userPool = new CognitoUserPool(
    'ap-south-1_vJl7jtWLM',
    '6t4ama2lc5923jvhmkt4ghe9fh',
  );




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body:
      ListView(
        children: <Widget>[
          showAlert(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    FadeAnimation(
                        1,
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.2,
                        Text(
                          "Create a customer account, It's free.",
                          style:
                              TextStyle(fontSize: 15, color: Colors.grey[700]),
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 25.0),
                    FadeAnimation(
                      1.2,
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Username",
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
                          username = value;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FadeAnimation(
                      1.2,
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Email",
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
                              Icons.email,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FadeAnimation(
                      1.3,
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
                          ),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FadeAnimation(
                      1.4,
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Contact",
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
                              Icons.phone,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          contact = value;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FadeAnimation(
                      1.2,
                      TextField(
                        decoration: InputDecoration(
                            hintText: "Address",
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
                              Icons.home,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          address = value;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FadeAnimation(
                      1.2,
                      TextField(
                        decoration: InputDecoration(
                            hintText: "State",
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
                              Icons.flag,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          state = value;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    FadeAnimation(
                      1.2,
                      TextField(
                        decoration: InputDecoration(
                            hintText: "City",
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
                              Icons.location_city,
                              color: Colors.black54,
                            )),
                        onChanged: (value) {
                          city = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
                FadeAnimation(
                  1.5,
                  Container(
                    height: 55,
                    child: RaisedButton(
                      onPressed: () async{
                        print(username);
                        print(password);
                        final userAttributes = [
                          new AttributeArg(name: 'name', value: username),
                          new AttributeArg(name: 'email', value: email),
                          new AttributeArg(name: 'phone_number', value: '+91$contact'),
                          new AttributeArg(name: 'address', value: '$address, $state, $city'),

                        ];
                        var data;
                        try {
                          data = await userPool.signUp(
                            username,
                            password,
                            userAttributes: userAttributes,
                          );
                          Alert(
                              context: context,
                              title: "Enter OTP",
                              content: Column(
                                children: <Widget>[
                                  TextField(
                                    decoration: InputDecoration(
                                      icon: Icon(Icons.sms),
                                      labelText: 'OTP',
                                    ),
                                    onChanged: (value){
                                      Otp = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: (){

                                    },
                                    child: Text('Resend OTP',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),

                                  )
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  onPressed: () async {
                                    print(Otp);
                                    print(contact);
                                    final cognitoUser = new CognitoUser(username, userPool);

                                    bool registrationConfirmed = false;
                                    try {
                                      registrationConfirmed = await cognitoUser.confirmRegistration(Otp);
                                      Navigator.pop(context);
                                      sucess = 'Success';

                                    } catch (e) {
                                      print(e);
                                    }
                                    print(registrationConfirmed);
                                  },
                                  child: Text(
                                    " SUBMIT",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ]).show();


                        } catch (e) {
                          print(e);
                          Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Error Occured",
                            desc: "Please ensure that the username and password is correct",

                          ).show();


                        }

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
                          constraints:
                              BoxConstraints(maxWidth: 260.0, minHeight: 60.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                FadeAnimation(
                    1.6,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account ?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: LoginPageCustomer()));
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 30.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
        suffixIcon: hintText == "Password"
            ? IconButton(
                onPressed: toggleVisibility,
                icon: isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "Password" ? isHidden : false,
    );
  }
   Widget showAlert(){
     if(sucess != ''){
       return Container(
         color: Colors.red,
         width: double.infinity,
         child: Text(sucess,
           style: TextStyle(
             color: Colors.white,
           ),
         ),
       );
     }
     return SizedBox(height: 0,);
   }
}
