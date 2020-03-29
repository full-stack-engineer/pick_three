import 'package:flutter/foundation.dart';
import 'dart:math';

class TypeData with ChangeNotifier {
  List<String> types = [];

  void setType(List<String> newTypes) {
    types = newTypes;
    notifyListeners();
  }

  void randSetType() {
    types.clear();
    List<String> allTypes = ['work', 'friend', 'family', 'sport', 'sleep'];

    for (int i=0; i<3; i++) {
      int randomNum = Random().nextInt(allTypes.length);
      types.add(allTypes[randomNum]);
      allTypes.removeAt(randomNum);
    }
    notifyListeners();
  }
}