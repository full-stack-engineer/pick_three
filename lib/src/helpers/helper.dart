import 'dart:ui';
import 'package:pickthree/src/extensions/hex_color.dart';

class Helper {
  static Color tileColor(String categoryText) {
    switch (categoryText) {
      case '仕事':
        return HexColor.fromHex('#EC527F');
      case '運動':
        return HexColor.fromHex('#7DCBBF');
      case '家庭':
        return HexColor.fromHex('#FCAD43');
      case '友人':
        return HexColor.fromHex('#F78863');
      case '睡眠':
        return HexColor.fromHex('#825CC6');
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
    }
  }
}
