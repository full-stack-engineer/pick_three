import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

class CategoryData with ChangeNotifier {
  List<String> pickedCategories = [];
  Map<String, bool> categories = {'仕事': false, '運動': false, '家庭': false, '友人': false, '睡眠': false};

  void pickCategory(String categoryName) {
    categories[categoryName] = !categories[categoryName];
    notifyListeners();
  }

  int pickThreeCount() {
    int count = 0;
    if (pickedCategories.length != 3) {
      pickedCategories.clear();
    }
    for (String categoryName in categories.keys) {
      if (categories[categoryName] == true) {
        count++;
        pickedCategories.add(categoryName);
      }
    }
    print(pickedCategories);
    notifyListeners();
    return count;
  }

  void randPickCategories() {
    resetCategories();
    List<String> allCategories = ['仕事', '運動', '家庭', '友人', '睡眠'];

    for (int i=0; i<2; i++) {
      int randomNum = Random().nextInt(allCategories.length);
      allCategories.removeAt(randomNum);
      print(allCategories);
    }

    allCategories.forEach((String categoryName) {
      categories[categoryName] = !categories[categoryName];
    });

    notifyListeners();
  }

  void resetCategories() {
    List<String> allCategories = ['仕事', '運動', '家庭', '友人', '睡眠'];

    allCategories.forEach((String categoryName) {
      categories[categoryName] = false;
    });

    notifyListeners();
  }
}