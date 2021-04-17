import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './views/screens/home_screen.dart';

class CalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Demo App',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColor: const Color.fromRGBO(235, 234, 234, 1.0),
          brightness: Brightness.light,
          accentColor: const Color.fromRGBO(253, 134, 56, 1.0),
          fontFamily: '',
          textTheme: TextTheme(
            headline3: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
          )),
      home: HomeScreen(),
    );
  }
}
