import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/dashboard/dashboard.dart';
import 'package:srmdot/dashboard/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddItemPage extends StatefulWidget {
  String RF_ID;
  AddItemPage({this.RF_ID});

  static String id = 'add_item_page';
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _formKey = GlobalKey<FormState>();
  String maxWeight;
  String itemName;
  String generatedRFID;
  int check = 0;
  Map<String, dynamic> formData;
  List<String> items = [
    'Dal',
    'Roti',
    'Rice',
    'Vegetables',
    'Juice',
    'Coffee',
  ];
  void getData() async{
    http.Response response = await http.get("https://h9ofkxiysc.execute-api.ap-south-1.amazonaws.com/RFID_API/RF_ID/${widget.RF_ID}");
    if(response.statusCode == 200){
      String data = response.body;
      print(data);
      var decodeData = jsonDecode(data);

      String weight = decodeData['Items'][0]['Weight_Data']["N"];

      print(weight);
    }
    else{
      print('${response.statusCode} error hai');
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
              Navigator.pop(context);
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
                    'Add Item',
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
                              child: QrCodeScanner()));
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
                              'RF ID',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF616e7e),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Text(
                                widget.RF_ID == null
                                    ? 'Click Here to scan'
                                    : widget.RF_ID,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0)),
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: DropDownField(
                      icon: Icon(
                        Icons.whatshot,
                        color: Color(0xFF616e7e),
                      ),
                      required: true,
                      hintText: 'Choose Item',
                      labelText: 'Item',
                      items: items,
                      strict: false,
                      setter: (dynamic newValue) {
                        itemName = newValue;
                      }),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      maxWeight = value;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.shopping_cart,
                        color: Color(0xFF616e7e),
                      ),
                      labelText: 'Max Weight (Kgs)',
                      labelStyle: TextStyle(
                        color: Color(0xFF616e7e),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepOrange, width: 2.5),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                    ),
                  ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
//                          RF_Id: widget.RF_ID,
//                          maxWeight: maxWeight,
//                          itemName: itemName,
                      ),
                    );
                    getData();
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
                        "Add",
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
