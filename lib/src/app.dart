import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './views/screens/home_screen.dart';

class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  bool _isDark = false;

  changeCurrentTheme() {
    setState(() {
     _isDark = !_isDark;
    });
  }



  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: const Color.fromRGBO(235, 234, 234, 1.0),
    brightness: Brightness.light,
    accentColor: const Color.fromRGBO(253, 134, 56, 1.0),
    // fontFamily: 'Inter',
    textTheme: TextTheme(
      headline3: TextStyle(
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
          color: const Color.fromRGBO(253, 134, 56, 1.0)),
      headline6: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 0.0),
    ),
  );
  ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
  );

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator  App',
      darkTheme: _dark,
      theme: _light,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(changeCurrentTheme),
    );
  }
}
