import 'package:flutter/foundation.dart';

printDebug(object) {
  if (kDebugMode) {
    print(object.toString());
  }
}
