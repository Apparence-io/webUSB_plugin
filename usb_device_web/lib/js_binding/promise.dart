@JS()
library promise;
import 'dart:js_util';

import 'package:js/js.dart';

@JS()
class Promise<T> {
  external void then(T val);
}

extension BindPromise<T> on Promise<T> {
  Future<T> get future => promiseToFuture(this);
}
