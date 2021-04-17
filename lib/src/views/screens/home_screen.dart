import 'package:flutter/material.dart';
import 'package:kokotoa/src/views/components/display.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    //To get Height of safe Are for iOS 11.
    var padding = MediaQuery.of(context).padding;
    double newHeight = height - padding.top - padding.bottom;

    



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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         Display(),
          Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: const FlutterLogo(),
            ),
          ),
        ],
      ),
    );
  }
}
