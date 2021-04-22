import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String value;
  final double height;

  Display({Key key, this.height, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    TextStyle textStyle1 = Theme.of(context).textTheme.headline3.copyWith(fontSize: 20);
    TextStyle textStyle2 = Theme.of(context).textTheme.headline3.copyWith();

    return Container(
      width: size,
      height: 209,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromRGBO(253, 134, 56, 1.0),
          width: 1, //                   <--- border width here
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
                '3000',
                style: textStyle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
