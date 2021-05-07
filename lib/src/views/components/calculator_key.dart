import 'package:flutter/material.dart';
import 'package:kokotoa/src/views/components/key_symbol.dart';
import 'package:kokotoa/src/models/key_controller.dart';


abstract class Keys {
  static KeySymbol clear = const KeySymbol('C');
  static KeySymbol sign = const KeySymbol('±');
  static KeySymbol percent = const KeySymbol('%');
  static KeySymbol divide = const KeySymbol('÷');
  static KeySymbol multiply = const KeySymbol('x');
  static KeySymbol subtract = const KeySymbol('-');
  static KeySymbol add = const KeySymbol('+');
  static KeySymbol equals = const KeySymbol('=');
  static KeySymbol decimal = const KeySymbol('.');

  static KeySymbol zero = const KeySymbol('0');
  static KeySymbol one = const KeySymbol('1');
  static KeySymbol two = const KeySymbol('2');
  static KeySymbol three = const KeySymbol('3');
  static KeySymbol four = const KeySymbol('4');
  static KeySymbol five = const KeySymbol('5');
  static KeySymbol six = const KeySymbol('6');
  static KeySymbol seven = const KeySymbol('7');
  static KeySymbol eight = const KeySymbol('8');
  static KeySymbol nine = const KeySymbol('9');
}

class CalculatorKey extends StatelessWidget {
  CalculatorKey({this.symbol});

  final KeySymbol ?symbol;

  static dynamic _fire(CalculatorKey key) => KeyController.fire(KeyEvent(key));

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 4;
    // double height = MediaQuery.of(context).size.height / 5;
    TextStyle textStyle = Theme.of(context).textTheme.headline3!.copyWith(color: const Color.fromRGBO(253, 134, 56, 1.0));

    return GestureDetector(
      onTap: () => _fire(this),
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        width: size,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: const Color.fromRGBO(38, 38, 52, 1.0),
          ),
          borderRadius: BorderRadius.all(Radius.circular(25.0))
        ),
        child: Text(
          symbol!.value,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
