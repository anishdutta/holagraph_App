import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:srmdot/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:srmdot/Profile/profile.dart';


void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FeedPage(),
    )
);

class FeedPage extends StatefulWidget {
  static String id = 'Feed_screen';

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {

    super.initState();
    currentIndex = 0;

  }
  int currentIndex;



  changePage(int index) {
    setState(() {
      currentIndex = index;
      print(index);
      if (index == 0) {

      }
      if (index == 1) {

      }
      if (index == 2) {

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      backgroundColor: Colors.white,
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
                  child: Image.asset('assets/images/logo  done.png',
                  scale: 7,)),
              SizedBox(
                height: 10,
              ),
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
                      "Home",
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
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: MyProfile(),
                      ));
                },
              ),
              ListTile(
                title: Text(
                  "Job Provider",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.people,
                  color: Color(0xFF616e7e),
                ),
                onTap: () {
                  Navigator.pop(context);

                },
              ),

              ListTile(
                title: Text(
                  "Privacy Settings",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.settings,
                  color: Color(0xFF616e7e),
                ),
                onTap: () {

                },
              ),
              ListTile(
                title: Text(
                  "Health News",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.local_hospital,
                  color: Color(0xFF616e7e),
                ),
                onTap: () {

                },
              ),
              ListTile(
                title: Text(
                  "Featured People",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  Icons.stars,
                  color: Color(0xFF616e7e),
                ),
                onTap: () {

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
              Icons.home,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
            ),
            title: Text('Home'),

          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(
              Icons.people_outline,

              color: Colors.black,
            ),
            activeIcon: Icon(              Icons.people,

              color: Colors.indigo,
            ),
            title: Text('Connections'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.notifications,
              color: Colors.deepPurple,
            ),
            title: Text('Notification'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.card_travel,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.card_travel,
              color: Colors.deepPurple,
            ),
            title: Text('Jobs'),
          ),
        ],
      ),
      
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.teal,

              height: 60,
              padding: EdgeInsets.only( right: 10, left: 10),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 25.5,
                    ),
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                  SizedBox(width: 20,),

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[200]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, color: Colors.grey,),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Search",
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  IconButton(
                    icon: Icon(
                      Icons.message,
                      color: Colors.white,
                      size: 25.5,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: Inbox(),
                          ));
                    }
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(height: 10,),
                      makeFeed(
                          userName: 'Aiony Haust',
                          userImage: 'assets/images/aiony-haust.jpg',
                          feedTime: '1 hr ago',
                          feedText: 'All the Lorem Ipsum generators on the Internet tend to repeat predefined.',
                          feedImage: 'assets/images/story/story-2.jpg'
                      ),
                      makeFeed(
                          userName: 'Azamat Zhanisov',
                          userImage: 'assets/images/azamat-zhanisov.jpg',
                          feedTime: '3 mins ago',
                          feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                          feedImage: ''
                      ),
                      makeFeed(
                          userName: 'Azamat Zhanisov',
                          userImage: 'assets/images/azamat-zhanisov.jpg',
                          feedTime: '3 mins ago',
                          feedText: "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                          feedImage: 'assets/images/averie-woodard.jpg'
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



  Widget makeFeed({userName, userImage, feedTime, feedText, feedImage}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(userImage),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(userName, style: TextStyle(color: Colors.grey[900], fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1),),
                      SizedBox(height: 3,),
                      Text(feedTime, style: TextStyle(fontSize: 15, color: Colors.grey),),
                    ],
                  )
                ],
              ),
              IconButton(
                icon: Icon(Icons.more_horiz, size: 30, color: Colors.grey[600],),
                onPressed: () {},
              )
            ],
          ),
          SizedBox(height: 20,),
          Text(feedText, style: TextStyle(fontSize: 15, color: Colors.grey[800], height: 1.5, letterSpacing: .7),),
          SizedBox(height: 20,),
          feedImage != '' ?
          Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(feedImage),
                    fit: BoxFit.cover
                )
            ),
          ) : Container(),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  makeLike(),
                  Transform.translate(
                      offset: Offset(-5, 0),
                      child: makeLove()
                  ),
                  SizedBox(width: 5,),
                  Text("2.5K", style: TextStyle(fontSize: 15, color: Colors.grey[800]),)
                ],
              ),
              Text("400 Comments", style: TextStyle(fontSize: 13, color: Colors.grey[800]),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              makeLikeButton(isActive: true),
              makeCommentButton(),
              makeShareButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget makeLike() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)
      ),
      child: Center(
        child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
      ),
    );
  }

  Widget makeLove() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)
      ),
      child: Center(
        child: Icon(Icons.favorite, size: 12, color: Colors.white),
      ),
    );
  }
  Widget makeLikeButton({isActive}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.thumb_up, color: isActive ? Colors.blue : Colors.grey, size: 18,),
            SizedBox(width: 5,),
            Text("Like", style: TextStyle(color: isActive ? Colors.blue : Colors.grey),)
          ],
        ),
      ),
    );
  }
  Widget makeCommentButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.chat, color: Colors.grey, size: 18),
            SizedBox(width: 5,),
            Text("Comment", style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
    );
  }
  Widget makeShareButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.share, color: Colors.grey, size: 18),
            SizedBox(width: 5,),
            Text("Share", style: TextStyle(color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}