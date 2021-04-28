import 'package:flutter/material.dart';
import 'package:kokotoa/src/views/components/display.dart';
import 'package:kokotoa/src/views/components/key_pad.dart';

class HomeScreen extends StatelessWidget {
  Function changeCurrentTheme;

  HomeScreen(Function changeCurrentTheme) {
    this.changeCurrentTheme = changeCurrentTheme;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline3.copyWith(
          fontSize: 25.0,
        );

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    //To get Height of safe Are for iOS 11.
    var padding = MediaQuery.of(context).padding;
    double newHeight = height - padding.top - padding.bottom;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'calculator',
          style: textStyle,
        ),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.menu,
            color: const Color.fromRGBO(253, 134, 56, 1.0),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                changeCurrentTheme();
              },
              child: Icon(Icons.ac_unit_sharp),
            ),
          ),
        ],
        actionsIconTheme: IconThemeData(
          size: 30.0,
          color: const Color.fromRGBO(253, 134, 56, 1.0),
          opacity: 10.0,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Display(),
          Expanded(
            child: FittedBox(
              fit: BoxFit.cover, // otherwise the logo will be tiny
              child: KeyPad(),
            ),
          ),
        ],
      ),
    );
  }
}
