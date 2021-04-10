import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './views/CalculatorHomeScreen.dart';

class CalculatorApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);



    return MaterialApp(
      title: 'Calculator Demo App',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(title: 'Calculator Demo App'),
    );
  }
}

