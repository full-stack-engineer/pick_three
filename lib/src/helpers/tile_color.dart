import 'dart:ui';
import 'package:pickthree/src/extensions/hex_color.dart';

class TileColor {
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
}
