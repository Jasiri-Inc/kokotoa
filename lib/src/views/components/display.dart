import 'package:flutter/material.dart';
import 'package:kokotoa/src/models/key_controller.dart';
import 'package:kokotoa/src/models/processor.dart';

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  String _output = '';

  @override
  void initState() {
    KeyController.listen((event) => Processor.process(event));
    Processor.listen((data) => setState(() {
          _output = data;
        }));
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
    double size = MediaQuery.of(context).size.width;

    TextStyle textStyle1 = Theme.of(context).textTheme.headline3!.copyWith(
          fontSize: 20,
          color: const Color.fromRGBO(253, 134, 56, 1.0),
        );
    TextStyle textStyle2 = Theme.of(context).textTheme.headline3!.copyWith(
          color: const Color.fromRGBO(253, 134, 56, 1.0),
        );

    return Container(
      width: size,
      height: 209,
      margin: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(253, 134, 56, 1.0),
          width: 2, //                   <--- border width here
        ),
        borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
      ),
      //
      //             <--- BoxDecoration here
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '15 × 200',
                style: textStyle1,
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                _output,
                style: textStyle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
