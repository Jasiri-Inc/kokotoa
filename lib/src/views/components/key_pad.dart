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
            CalculatorKey(symbol: Keys.percent),
            CalculatorKey(symbol: Keys.divide),
          ],
        ),
        Row(
          children: <Widget>[
            CalculatorKey(symbol: Keys.clear),
            CalculatorKey(symbol: Keys.sign),
            CalculatorKey(symbol: Keys.percent),
            CalculatorKey(symbol: Keys.divide),
          ],
        ),
        Row(
          children: <Widget>[
            CalculatorKey(symbol: Keys.clear),
            CalculatorKey(symbol: Keys.sign),
            CalculatorKey(symbol: Keys.percent),
            CalculatorKey(symbol: Keys.divide),
          ],
        ),
        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CalculatorKey(symbol: Keys.clear),
                    CalculatorKey(symbol: Keys.sign),
                    CalculatorKey(symbol: Keys.percent),
                  ],
                ),
                Row(
                  children: <Widget>[
                    CalculatorKey(symbol: Keys.clear),
                    CalculatorKey(symbol: Keys.sign),
                    CalculatorKey(symbol: Keys.percent),
                  ],
                )
              ],
            ),
            Column(
              children: <Widget>[
               SizedBox(
                 height: 280,
                 child:  CalculatorKey(symbol: Keys.clear),
               )
              ],
            ),
          ],
        )
      ],
    );
  }
}
