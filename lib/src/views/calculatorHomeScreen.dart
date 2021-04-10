import 'package:flutter/material.dart';



class CalculatorHomePage extends StatefulWidget {

  CalculatorHomePage({Key key, this.title}) : super(key: key);



  final String title;


  @override
  _CalculatorHomePage createState() => _CalculatorHomePage();

}

class _CalculatorHomePage extends State<CalculatorHomePage> {


  String _output;

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {


    super.dispose();
  }




  @override
  Widget build(BuildContext context) {


    Size screen = MediaQuery.of(context).size;
    double buttonSize = screen.width / 4;
    double displayHeight = screen.height - (buttonSize * 5) - (buttonSize);



    return Scaffold(

      backgroundColor: const Color(0xff212121 ),

      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => (print('yes')),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
