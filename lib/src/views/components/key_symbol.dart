import './calculator_key.dart';

enum KeyType {FUNCTION, OPERATOR, INTEGER}

class KeySymbol {


  final String value;
  const KeySymbol(this.value);


  @override
  String toString() => value;

  static List<KeySymbol> _function = [Keys.clear, Keys.sign, Keys.percent, Keys.decimal ];
  static List<KeySymbol> _operator = [Keys.divide, Keys.multiply, Keys.subtract, Keys.add, Keys.equals];


  bool get isOperator => _operator.contains(this);
  bool get isFunction => _function.contains(this);
  bool get isInteger => !isOperator && !isFunction;


  KeyType get type => isFunction ? KeyType.FUNCTION : (isOperator ? KeyType.OPERATOR : KeyType.INTEGER);





  // bool get isOperator => _operator.contains(this);




}