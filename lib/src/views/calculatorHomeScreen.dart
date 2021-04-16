import 'package:flutter/material.dart';
import 'package:kokotoa/src/controllers/key_controller.dart';
import 'package:kokotoa/src/controllers/processor.dart';
import 'package:kokotoa/src/views/components/display.dart';
import 'package:kokotoa/src/views/components/key_pad.dart';


class CalculatorHomePage extends StatefulWidget {

  final String title;

  CalculatorHomePage({Key key, this.title}) : super(key: key);

  @override
  _CalculatorHomePage createState() => _CalculatorHomePage();

}

class _CalculatorHomePage extends State<CalculatorHomePage> {

  String _output;


  @override
  void initState() {

    KeyController.listen((event) => Processor.process(event));
    Processor.listen((data) => setState(() { _output = data; }));
    Processor.refresh();
    super.initState();

  }

  @override
  void dispose() {

    KeyController.dispose();
    Processor.dispose();
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
            Display(value: _output, height: displayHeight,),
            KeyPad(),
          ],
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
