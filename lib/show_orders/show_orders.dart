import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/dashboard/dashboard.dart';
import 'package:srmdot/welcome_screen/customer_or_retailer.dart';
import 'Data_Table.dart';


class ShowOrders extends StatefulWidget {
  static String id = 'show_orders';
  @override
  _ShowOrdersState createState() => _ShowOrdersState();
}

class _ShowOrdersState extends State<ShowOrders> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<User> users;
  List<User> selectedUsers;
  bool sort=false;

  @override
    void initState(){
    sort = false;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }
  onSortColum(int columnIndex, bool ascending){
    if (columnIndex == 0){
      if(ascending){
        users.sort((a,b) => a.Orders.compareTo(b.Orders));
      } else {
        users.sort((a,b) => b.Orders.compareTo(a.Orders));
      }
    }
  }
  onSelectedRow(bool selected, User user) async{
      setState(() {
        if(selected){
          selectedUsers.add(user);
        }else{
          selectedUsers.remove(user);
        }
      });
  }
  deleteSelected() async{
    setState(() {
      if(selectedUsers.isNotEmpty){
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for(User user in temp){
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });

  }
  dataBody(){
    return DataTable(
      sortAscending: sort,
      sortColumnIndex: 0,
      columns: [


        DataColumn(
            label: Text("Orders", style: TextStyle(
              fontSize: 15,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),),
            numeric: true,
            tooltip: "Orders jvh",
          onSort: (columnIndex, ascending){
              setState(() {
                sort = !sort;
              });
              onSortColum(columnIndex, ascending);
          }


        ),

        DataColumn(
            label: Text("Time Date", style: TextStyle(
              fontSize: 15,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),),
            numeric: false,
            tooltip: "Orders"
        ),
        DataColumn(
            label: Text("Total Cost", style: TextStyle(
              fontSize: 15,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),),
            numeric: false,
            tooltip: "Orders"
        ),
        DataColumn(
            label: Text("Shop name", style: TextStyle(
              fontSize: 15,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),),
            numeric: false,
            tooltip: "Orders"
        ),
        DataColumn(
            label: Text("Status", style: TextStyle(
              fontSize: 15,
              color: Colors.deepOrange,
              fontWeight: FontWeight.bold,
            ),),
            numeric: false,
            tooltip: "Orders"
        ),
      ],
      rows: users
        .map(
              (user) => DataRow(
                selected: selectedUsers.contains(user),
                onSelectChanged: (b){
                    onSelectedRow(b, user);
                },
                  cells: [
          DataCell(
            Text('${user.Orders}', style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(70, 71, 68, 1)
            ),),
            onTap: (){
              print('${user.Orders}');
            }
          ),
        DataCell(
          Text(user.time_date, style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(18, 138, 122, 1),
          ),),
        ),
        DataCell(
          Text(user.Total_cost, style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(26, 106, 176, 1),
          ),),
        ),
        DataCell(
          Text(user.Shop_name, style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(8, 170, 191, 1),
            fontWeight: FontWeight.bold,
          ),),
        ),
        DataCell(
          Text(user.status, style: TextStyle(
            fontSize: 14,
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),),
        ),
      ])
      ).toList(),
    );
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
          title: Text(
            'Show Orders',
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
                ListTile(
                  title: Text(
                    "Dashboard",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: Icon(
                    Icons.home,
                    color: Color(0xFF616e7e),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: Dashboard(),
                        ));
                  },
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
                        "Show Orders",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                      leading: Icon(
                        Icons.shopping_cart,
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
                  onTap: () {},
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
                  onTap: () {},
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
                  onTap: () {},
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
        body: SingleChildScrollView(
          child: Column(

            children: <Widget>[
              SingleChildScrollView(
                scrollDirection: Axis.vertical,

                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: dataBody(),
                  ),

                ),
              ),
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: OutlineButton(
                        child: Text('SELECTED ${selectedUsers.length}'),
                        onPressed: (){},
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: OutlineButton(
                        child: Text('DELETE SELECTED'),
                        onPressed: selectedUsers.isEmpty ? null : (){
                          deleteSelected();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
