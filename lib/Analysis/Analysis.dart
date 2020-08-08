import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/dashboard/dashboard.dart';
import 'package:srmdot/welcome_screen/customer_or_retailer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'Indicator.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:srmdot/dashboard/add_item_page.dart';
import 'package:srmdot/Running_low/Running_low.dart';

class Analysis extends StatefulWidget {
  static String id = 'Analysis';
  @override
  _ShowOrdersState createState() => _ShowOrdersState();
}

class _ShowOrdersState extends State<Analysis> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int touchedIndex;
  int currentIndex;


  void initState() {

    super.initState();
    currentIndex = 2;

  }
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
    return MaterialApp(
      home: DefaultTabController(
        length: choices.length,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: const Text('Analysis'),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                          const Color(0xFFf12711),
                          const Color(0xFFf5af19),
                        ])
                ),
              ),
              bottom: TabBar(
                isScrollable: true,
                tabs: choices.map<Widget>((Choice choice) {
                  return Tab(
                    text: choice.title,
                    icon: Icon(choice.icon),
                  );
                }).toList(),
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

    body: TabBarView(
    children: choices.map((Choice choice) {
    return Padding(
    padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Weight Record', style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.deepOrange.shade700
              ),
              ),
            ),
            Card(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(
                            pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                              setState(() {
                                if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                    pieTouchResponse.touchInput is FlPanEnd) {
                                  touchedIndex = -1;
                                } else {
                                  touchedIndex = pieTouchResponse.touchedSectionIndex;
                                }
                              });
                            }),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: showingSections()),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Indicator(
                        color: Color(0xff0293ee),
                        text: 'Rice',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Color(0xfff8b250),
                        text: 'Daal',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Color(0xff845bef),
                        text: 'Salt',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Color(0xff13d38e),
                        text: 'Sugar',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Expenditure Record', style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Colors.deepOrange.shade700
              ),
              ),
            ),
            Card(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 18,
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(
                            pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                              setState(() {
                                if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                    pieTouchResponse.touchInput is FlPanEnd) {
                                  touchedIndex = -1;
                                } else {
                                  touchedIndex = pieTouchResponse.touchedSectionIndex;
                                }
                              });
                            }),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: showingSectionsExp()),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Indicator(
                        color: Color(0xff0293ee),
                        text: 'Rice',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Color(0xfff8b250),
                        text: 'Daal',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Color(0xff845bef),
                        text: 'Salt',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Indicator(
                        color: Color(0xff13d38e),
                        text: 'Sugar',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 28,
                  ),
                ],
              ),
            ),

          ],
        ),
      )
    );
    }).toList(),
    ),
        ),
      ),

    );
  }
  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
  List<PieChartSectionData> showingSectionsExp() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 60,
            title: '60%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }


}
class Choice {
  final String title;
  final IconData icon;
  const Choice({this.title, this.icon});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'WEEKLY', icon: Icons.view_week),
  Choice(title: 'MONTHLY', icon: Icons.calendar_view_day),
  Choice(title: 'YEARLY', icon: Icons.calendar_today),

];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              choice.icon,
              size: 150.0,
              color: textStyle.color,
            ),
            Text(
              choice.title,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}


//
//child: Column(
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text('Weight Record', style: TextStyle(
//fontWeight: FontWeight.w900,
//fontSize: 30,
//color: Colors.deepOrange.shade700
//),
//),
//),
//Card(
//color: Colors.white,
//child: Row(
//children: <Widget>[
//const SizedBox(
//height: 18,
//),
//Expanded(
//child: AspectRatio(
//aspectRatio: 1,
//child: PieChart(
//PieChartData(
//pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
//setState(() {
//if (pieTouchResponse.touchInput is FlLongPressEnd ||
//pieTouchResponse.touchInput is FlPanEnd) {
//touchedIndex = -1;
//} else {
//touchedIndex = pieTouchResponse.touchedSectionIndex;
//}
//});
//}),
//borderData: FlBorderData(
//show: false,
//),
//sectionsSpace: 0,
//centerSpaceRadius: 40,
//sections: showingSections()),
//),
//),
//),
//Column(
//mainAxisSize: MainAxisSize.max,
//mainAxisAlignment: MainAxisAlignment.end,
//crossAxisAlignment: CrossAxisAlignment.start,
//children: const <Widget>[
//Indicator(
//color: Color(0xff0293ee),
//text: 'Rice',
//isSquare: true,
//),
//SizedBox(
//height: 4,
//),
//Indicator(
//color: Color(0xfff8b250),
//text: 'Daal',
//isSquare: true,
//),
//SizedBox(
//height: 4,
//),
//Indicator(
//color: Color(0xff845bef),
//text: 'Salt',
//isSquare: true,
//),
//SizedBox(
//height: 4,
//),
//Indicator(
//color: Color(0xff13d38e),
//text: 'Sugar',
//isSquare: true,
//),
//SizedBox(
//height: 18,
//),
//],
//),
//const SizedBox(
//width: 28,
//),
//],
//),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Text('Expenditure Record', style: TextStyle(
//fontWeight: FontWeight.w900,
//fontSize: 30,
//color: Colors.deepOrange.shade700
//),
//),
//),
//Card(
//color: Colors.white,
//child: Row(
//children: <Widget>[
//const SizedBox(
//height: 18,
//),
//Expanded(
//child: AspectRatio(
//aspectRatio: 1,
//child: PieChart(
//PieChartData(
//pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
//setState(() {
//if (pieTouchResponse.touchInput is FlLongPressEnd ||
//pieTouchResponse.touchInput is FlPanEnd) {
//touchedIndex = -1;
//} else {
//touchedIndex = pieTouchResponse.touchedSectionIndex;
//}
//});
//}),
//borderData: FlBorderData(
//show: false,
//),
//sectionsSpace: 0,
//centerSpaceRadius: 40,
//sections: showingSectionsExp()),
//),
//),
//),
//Column(
//mainAxisSize: MainAxisSize.max,
//mainAxisAlignment: MainAxisAlignment.end,
//crossAxisAlignment: CrossAxisAlignment.start,
//children: const <Widget>[
//Indicator(
//color: Color(0xff0293ee),
//text: 'Rice',
//isSquare: true,
//),
//SizedBox(
//height: 4,
//),
//Indicator(
//color: Color(0xfff8b250),
//text: 'Daal',
//isSquare: true,
//),
//SizedBox(
//height: 4,
//),
//Indicator(
//color: Color(0xff845bef),
//text: 'Salt',
//isSquare: true,
//),
//SizedBox(
//height: 4,
//),
//Indicator(
//color: Color(0xff13d38e),
//text: 'Sugar',
//isSquare: true,
//),
//SizedBox(
//height: 18,
//),
//],
//),
//const SizedBox(
//width: 28,
//),
//],
//),
//),
//
//],
//),