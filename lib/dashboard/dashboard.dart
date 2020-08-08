import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/Services.dart';
import 'package:srmdot/dashboard/add_item_page.dart';
import 'package:srmdot/item_info/item_info.dart';
import 'package:srmdot/show_orders/show_orders.dart';
import 'package:srmdot/welcome_screen/customer_or_retailer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:srmdot/Analysis/Analysis.dart';
import 'package:srmdot/Profile/profile.dart';
import 'package:srmdot/login_page/login_page_customer.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:srmdot/iPhoneXXS11Pro1.dart';
import 'package:flutter/services.dart';
import 'package:srmdot/album.dart';
import 'package:srmdot/gridcell.dart';
import 'package:smart_grid_view/smart_grid_view.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:srmdot/Running_low/Running_low.dart';
import 'package:srmdot/Connect/Connect.dart';



class Dashboard extends StatefulWidget {
  static String id = 'dashboard';

  String RF_Id;
  String itemName;
  String maxWeight;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int flagValue = 0;
  gridview(AsyncSnapshot<List<Album>> snapshot){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
          crossAxisCount: 2,
        childAspectRatio: 1.0,
          mainAxisSpacing: 4.0,
        children: snapshot.data.map(
            (album){
              return GridTile(
                child: AlbumCell(album),
              );
            },
        ).toList(),
      ),
    );
  }
  circularProgress(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }
   getData() async{

    http.Response response = await http.get("https://bbuq4m2qf4.execute-api.ap-south-1.amazonaws.com/GetAllDataFromDynamoDb/common/dot");
    if(response.statusCode == 200){
      var decodeData = jsonDecode(response.body);
      return decodeData;


    }

  }
  final userPool = new CognitoUserPool(
    'ap-south-1_vJl7jtWLM',
    '6t4ama2lc5923jvhmkt4ghe9fh',
  );

  void getUser() async{
    final cognitoUser = new CognitoUser('anish11', userPool);

    List<CognitoUserAttribute> attributes;
    try {
      attributes = await cognitoUser.getUserAttributes();
    } catch (e) {
      print(e);
    }
    attributes.forEach((attribute) {
      print('attribute ${attribute.getName()} has value ${attribute.getValue()}');
    });
  }
  @override
  void initState() {
    getData();
    getUser();
    super.initState();
    currentIndex = 0;

  }
  int currentIndex;



  changePage(int index) {
    setState(() {
      currentIndex = index;
      print(index);
      if (index == 0) {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: Dashboard(),
            ));
      }
      if (index == 1) {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: Running_low(),
            ));
      }
      if (index == 2) {
        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: Analysis(),
            ));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          primary: true,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: 25.5,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer(),
          ),
          actions: <Widget>[
            SizedBox(
              width: 10.0,
            ),

            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
            )
          ],
          title: Text(
            'Dashboard',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),

        drawer: Drawer(
          elevation: 20.0,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10.0),
                    height: 80.0,
                    child: Image.asset('assets/images/dotlogo.png')),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                      ),
                      child: Text(
                        'Signed In',
                        style: TextStyle(
                          color: Color(0xFF616e7e),
                          fontSize: 19.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 10.0, bottom: 10.0),
                      child: Text(
                        'user@gmail.com',
                        style: TextStyle(
                          color: Color(0xFF616e7e),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFffe0cc),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(
                        "Dashboard",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(
                        Icons.home,
                        color: Colors.deepOrange,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Show Orders",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Color(0xFF616e7e),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: ShowOrders(),
                        ));
                  },
                ),
                ListTile(
                  title: Text(
                    "Running Low",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.report_problem,
                    color: Color(0xFF616e7e),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: iPhoneXXS11Pro1(),
                        ));
                  },
                ),
                ListTile(
                  title: Text(
                    "Connect",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.cast_connected,
                    color: Color(0xFF616e7e),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: ConnectPage(),
                        ));
                  },
                ),
                ListTile(
                  title: Text(
                    "Analysis",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.assessment,
                    color: Color(0xFF616e7e),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Analysis(),
                        ));
                  },
                ),
                ListTile(
                  title: Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.person,
                    color: Color(0xFF616e7e),
                  ),
                  onTap: () {
                    Navigator.pop(context);

                  },
                ),
                SizedBox(height: 20.0),
                SizedBox(
                  width: 60.0,
                  height: 50,
                  child: Divider(
                    height: 30.0,
                    thickness: 1.2,
                  ),
                ),
                Column(
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    MaterialButton(
                      padding: EdgeInsets.all(0.0),
                      splashColor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: CustomerOrRetailer(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(255, 123, 67, 1.0),
                                  Color.fromRGBO(245, 50, 111, 1.0)
                                ])),
                        width: 100.0,
                        height: 40.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                        child: Text(
                          'Version: 1.0.0',
                          style: TextStyle(
                            color: Color(0xFF616e7e),
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Cool FAB',
          child: Container(
            width: 56,
            height: 56,
            child: Icon(Icons.add,
            size: 35,),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 1.0],
                  colors: [
                    const Color(0xFFf12711),
                    const Color(0xFFf5af19),
                  ]
              ),
            ),
          ),
          onPressed: (){
            flagValue = 1;
          Navigator.push(
          context,
          PageTransition(
          type: PageTransitionType.fade, child: AddItemPage()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        bottomNavigationBar: BubbleBottomBar(
            opacity: 0.2,
            backgroundColor: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          currentIndex: currentIndex,
          hasInk: true,
          inkColor: Colors.black12,
          hasNotch: true,
          fabLocation: BubbleBottomBarFabLocation.end,
          onTap: changePage,
          items: [
            BubbleBottomBarItem(
              backgroundColor: Colors.deepOrange,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text('Dashboard'),

            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.settings_input_antenna,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.settings_input_antenna,
                color: Colors.indigo,
              ),
              title: Text('Alert'),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.pie_chart_outlined,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.pie_chart,
                color: Colors.deepPurple,
              ),
              title: Text('Analytics'),
            ),
          ],
        ),
        body:
        FutureBuilder(

                  future: getData(),

                  builder: (context , snapshot){

                    if(snapshot.hasData) {

                      return SmartGridView(

                        tileWidth: 108,

                        tileHeight: 168,

                        children: List.generate(

                            8,

                                (index) => Card(

                              child: GridTile(

                                child: Container(
                                  decoration: BoxDecoration(

                                  ),
                                  child: Column(
                                    children: <Widget>[

                                      SizedBox(
                                        height: 10,
                                      ),
                                      Icon(Icons.fastfood,
                                      color: Colors.teal,
                                      size: 35,),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text( '${snapshot.data['Items'][index]['Weight_Data']["N"]} Kg',

                                        style: TextStyle(

                                          fontSize: 15,

                                          color:  Colors.deepOrange,

                                          fontWeight: FontWeight.w900,

                                          letterSpacing: 1

                                        ),

                                      ),
                                    ],
                                  ),
                                ),

                              ),

                            )),


                      );

                    }

                    else{

                      return circularProgress();

                    }

                  },

                ),
      ),
    );
  }
}
class DynamoDb {
  final String RfidW;
  DynamoDb(this.RfidW);

}

//
//
//ListView(
//shrinkWrap: true,
//children: <Widget>[
//
//
//SizedBox(height: 20.0),
//Container(
//padding: EdgeInsets.only(left: 90.0, right: 90.0),
//width: 60.0,
//height: 65.0,
//child: OutlineButton(
//borderSide: BorderSide(
//width: 2.0,
//color: Colors.deepOrange,
//),
//onPressed: () {
//flagValue = 1;
//Navigator.push(
//context,
//PageTransition(
//type: PageTransitionType.fade, child: AddItemPage()));
//},
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.circular(10)),
//splashColor: Colors.deepOrange,
//child: Text(
//'Add Item',
//style: TextStyle(
//color: Colors.deepOrange,
//fontSize: 20.0,
//fontWeight: FontWeight.bold),
//),
//),
//
//),
//
//ListView.builder(
//shrinkWrap: true,
//itemCount: 1,
//itemBuilder: (context, index) {
//return flagValue == 1
//? Padding(
//padding: const EdgeInsets.all(10.0),
//child: GestureDetector(
//onTap: () {
//Navigator.push(
//context,
//PageTransition(
//type: PageTransitionType.fade,
//child: ItemInfo()));
//},
//child: Center(
//child: Card(
//elevation: 3.0,
//child: Container(
//height: 60.0,
//width: 60.0,
//color: Colors.deepOrange),
//),
//),
//),
//)
//    : Padding(
//padding: const EdgeInsets.all(10.0),
//child: GestureDetector(
//onTap: () {
//Navigator.push(
//context,
//PageTransition(
//type: PageTransitionType.fade,
//child: ItemInfo()));
//},
//child: Center(
//child: Card(
//elevation: 3.0,
//child: Container(
//height: 60.0,
//width: 60.0,
//color: Colors.black),
//),
//),
//),
//);
//},
//),
//],
//),

//return ListView.builder(itemBuilder: (context, index){
//return Padding(
//padding: const EdgeInsets.all(1.0),
//child: ListTile(
//leading: CircleAvatar(backgroundImage: NetworkImage('https://images.financialexpress.com/2019/09/sugar-reuters.jpg'),),
//title: Text('Weight: ${snapshot.data['Items'][index]['Weight_Data']["N"]}'),
//subtitle: Text('RF_ID: ${snapshot.data['Items'][index]['RF_ID']["S"]}'),
//
//),
//);
//},
//);



