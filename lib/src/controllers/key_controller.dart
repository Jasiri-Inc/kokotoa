import 'dart:async';

import 'package:kokotoa/src/views/components/calculator_key.dart';


class KeyEvent {

  final CalculatorKey key;
  KeyEvent(this.key);

}



abstract class KeyController {

  static StreamController _controller = StreamController();
  static Stream get _stream => _controller.stream;

  static StreamSubscription listen(Function handler) => _stream.listen(handler as dynamic);
  static void fire(KeyEvent event) => _controller.add(event);

  static dispose() => _controller.close();
}