import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'QRscan.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:srmdot/dashboard/dashboard.dart';



class ConnectPage extends StatefulWidget {
  String QR;
  ConnectPage({this.QR});

  static String id = 'connect_page';
  @override
  _ConnectPageState createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }
  final _formKey = GlobalKey<FormState>();
  String maxWeight;
  String itemName;
  String generatedRFID;
  int check = 0;
  Map<String, dynamic> formData;

  _launchURL() async {
    String url = widget.QR;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.deepOrange,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 28.0,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: Dashboard(),
                  ));
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 80.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(55.0),
                          bottomLeft: Radius.circular(55.0))),
                  child: Text(
                    'Connect to dash',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontFamily: 'BalsamiqSans',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),

                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: QrScan()
                          ));
                    },
                    child: Container(
                        height: 57.0,
                        padding: EdgeInsets.only(left: 10.0, right: 15.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border:
                          Border.all(color: Colors.deepOrange, width: 2.5),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search, color: Color(0xFF616e7e)),
                            SizedBox(width: 9.0),
                            Text(
                              'QR',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF616e7e),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                                widget.QR == null
                                    ? 'Click Here to scan'
                                    : widget.QR,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0)),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),


              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110.0, right: 110.0),
              child: Container(
                height: 57,
                child: RaisedButton(
                  onPressed: () {
                    _launchURL();

                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  padding: EdgeInsets.all(0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(255, 123, 67, 1.0),
                          Color.fromRGBO(245, 50, 111, 1.0)
                        ]),
                        borderRadius: BorderRadius.circular(50)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Connect",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
