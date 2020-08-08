import 'package:circulardropdownmenu/circulardropdownmenu.dart';
import 'package:flutter/material.dart';

class ItemInfo extends StatefulWidget {
  static String id = 'item_info';

  @override
  _ItemInfoState createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  String _selectedFrequency = 'Daily';
  int consumedWeight = 60;
  int totalWeight = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 28.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15.0,
                  ),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/dotlogo.png'),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Item Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Consumed : $consumedWeight kgs',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Total : $totalWeight kgs',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 0.0, right: 220.0),
                    child: CircularDropDownMenu(
                      dropDownMenuItem: [
                        DropdownMenuItem(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('Daily'),
                          ),
                          value: 'Daily',
                        ),
                        DropdownMenuItem(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('Weekly'),
                          ),
                          value: 'Weekly',
                        ),
                        DropdownMenuItem(
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('Monthly'),
                          ),
                          value: 'Monthly',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedFrequency = value;
                        });
                      },
                      hintText: _selectedFrequency,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
