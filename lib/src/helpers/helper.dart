import 'dart:ui';

class Helper {
  // TODO: category は enum にしたい
  static Color tileColor(String categoryText) {
    switch (categoryText) {
      case '仕事':
        return Color(0xFFEC527F);
      case '運動':
        return Color(0xFF7DCBBF);
      case '家庭':
        return Color(0xFFFCAD43);
      case '友人':
        return Color(0xFFF78863);
      case '睡眠':
        return Color(0xFF825CC6);
      default:
        return Color(0xFFFFFFFF);
    }
  }

  static Color tileBackgroundColor(String categoryText) {
    switch (categoryText) {
      case '仕事':
        return Color.fromRGBO(236, 82, 127, 0.16);
      case '運動':
        return Color.fromRGBO(125, 203, 191, 0.16);
      case '家庭':
        return Color.fromRGBO(252, 173, 67, 0.16);
      case '友人':
        return Color.fromRGBO(247, 136, 99, 0.16);
      case '睡眠':
        return Color.fromRGBO(130, 92, 198, 0.16);
      default:
        return Color(0xFFFFFFFF);
    }
  }
}
