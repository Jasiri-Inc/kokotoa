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
        primaryColor: Colors.blue,

      ),
      home: HomeScreen(),
    );
  }
}
