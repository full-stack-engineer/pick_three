import 'package:flutter/material.dart';
import 'package:pickthree/src/extensions/hex_color.dart';

class CategoryMemoTile extends StatelessWidget {
  final String categoryText;
  final String destinationId;

  CategoryMemoTile(this.categoryText, this.destinationId);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: tileColor(categoryText),
      onPressed: () {
        print('tapped');
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        height: 152,
        child: Text(
          categoryText,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  Color tileColor(String categoryText) {
    switch(categoryText) {
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
