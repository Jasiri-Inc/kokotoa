import 'dart:async';

import 'package:kokotoa/src/controllers/key_controller.dart';
import 'package:kokotoa/src/views/components/calculator_key.dart';
import 'package:kokotoa/src/views/components/key_symbol.dart';

abstract class Processor {
  static KeySymbol _operator;
  static String _firstValue = '0';
  static String _secondValue = '0';
  static String _result;

  static StreamController _controller = StreamController();

  static Stream get _stream => _controller.stream;

  static StreamSubscription listen(Function handler) => _stream.listen(handler);

  static void refresh() => _fire(_output);

  static void _fire(String data) => _controller.add(_output);

  static String get _output => _result == null ? _equation : _result;

  static String get _equation =>
      _firstValue +
      (_operator != null ? ' ' + _operator.value : '') +
      (_firstValue != '0' ? ' ' + _secondValue : '');

  static dispose() => _controller.close();

  static process(dynamic event) {
    CalculatorKey key = (event as KeyEvent).key;
    switch (key.symbol.type) {
      case KeyType.FUNCTION:
        return handleFunction(key);

      case KeyType.OPERATOR:
        return handleOperator(key);

      case KeyType.INTEGER:
        return handleInteger(key);
    }
  }

  static void handleFunction(CalculatorKey key) {
    if (_firstValue == '0') {
      return;
    }
    if (_result != null) {
      _condense();
    }

    Map<KeySymbol, dynamic> table = {
      Keys.clear: () => _clear(),
      Keys.sign: () => _sign(),
      Keys.percent: () => _percent(),
      Keys.decimal: () => _decimal(),
    };

    table[key.symbol]();
    refresh();
  }

  static void handleOperator(CalculatorKey key) {
    if (_firstValue == '0') {
      return;
    }
    if (key.symbol == Keys.equals) {
      return _calculate();
    }
    if (_result != null) {
      _condense();
    }

    _operator = key.symbol;
    refresh();
  }

  static void handleInteger(CalculatorKey key) {
    String val = key.symbol.value;
    if (_operator == null) {
      _firstValue = (_firstValue == '0') ? val : _firstValue + val;
    } else {
      _secondValue = (_secondValue == '0') ? val : _secondValue + val;
    }
    refresh();
  }

  static void _clear() {
    _firstValue = _secondValue = '0';
    _operator = _result = null;
  }

  static void _sign() {
    if (_secondValue != '0') {
      _secondValue = (_secondValue.contains('-')
          ? _secondValue.substring(1)
          : '-' + _secondValue);
    } else if (_firstValue != '0') {
      _firstValue = (_firstValue.contains('-')
          ? _firstValue.substring(1)
          : '-' + _firstValue);
    }
  }

  static String calcPercent(String x) => (double.parse(x) / 100).toString();

  static void _percent() {
    if (_secondValue != '0' && !_secondValue.contains('.')) {
      _secondValue = calcPercent(_secondValue);
    } else if (_firstValue != '0' && !_firstValue.contains('.')) {
      _firstValue = calcPercent(_firstValue);
    }
  }

  static void _decimal() {
    if (_secondValue != '0' && !_secondValue.contains('.')) {
      _secondValue = _secondValue + '.';
    } else if (_firstValue != '0' && !_firstValue.contains('.')) {
      _firstValue = _firstValue + '.';
    }
  }

  static void _calculate() {
    if (_operator == null || _secondValue == '0') {
      return;
    }

    Map<KeySymbol, dynamic> table = {
      Keys.divide: (a, b) => (a / b),
      Keys.multiply: (a, b) => (a * b),
      Keys.subtract: (a, b) => (a - b),
      Keys.add: (a, b) => (a + b)
    };

    double result =
        table[_operator](double.parse(_firstValue), double.parse(_secondValue));

    String str = result.toString();

    while ((str.contains('.') && str.endsWith('0')) || str.endsWith('.')) {
      str = str.substring(0, str.length - 1);
    }

    _result = str;
    refresh();
  }

  static void _condense() {
    _firstValue = _result;
    _secondValue = '0';
    _result = _operator = null;
  }
}
