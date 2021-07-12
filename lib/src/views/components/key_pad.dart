import 'package:flutter/material.dart';
import 'package:kokotoa/src/views/components/calculator_key.dart';
class KeyPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            CalculatorKey(symbol: Keys.clear),
            CalculatorKey(symbol: Keys.sign),
            CalculatorKey(symbol: Keys.divide),
            CalculatorKey(symbol: Keys.multiply),
          ],
        ),
        Row(
          children: <Widget>[
            CalculatorKey(symbol: Keys.seven),
            CalculatorKey(symbol: Keys.eight),
            CalculatorKey(symbol: Keys.nine),
            CalculatorKey(symbol: Keys.subtract),
          ],
        ),
        Row(
          children: <Widget>[
            CalculatorKey(symbol: Keys.four),
            CalculatorKey(symbol: Keys.five),
            CalculatorKey(symbol: Keys.six),
            CalculatorKey(symbol: Keys.add),
          ],
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CalculatorKey(symbol: Keys.three),
                    CalculatorKey(symbol: Keys.two),
                    CalculatorKey(symbol: Keys.one),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CalculatorKey(symbol: Keys.clear),
                    CalculatorKey(symbol: Keys.zero),
                    CalculatorKey(symbol: Keys.decimal),
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
               SizedBox(
                 height:( MediaQuery.of(context).size.height/4 + 40),
                 child:  CalculatorKey(symbol: Keys.equals),
               )
              ],
            ),
          ],
        )
      ],
    );
  }
}
