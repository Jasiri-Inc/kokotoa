import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'calculator',
        ),
        leading: GestureDetector(
          onTap: () {
            print('Clicked');
          },
          child: Icon(Icons.menu),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                print('clicked');
              },
              child: Icon(Icons.ac_unit_sharp),
            ),
          )
        ],
        actionsIconTheme: IconThemeData(
          size: 30.0,
          color: Colors.deepOrange,
          opacity: 10.0,
        ),
      ),
    );
  }
}
