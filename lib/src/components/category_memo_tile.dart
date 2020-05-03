import 'package:flutter/material.dart';
import 'package:pickthree/src/extensions/hex_color.dart';

class CategoryMemoTile extends StatelessWidget {
  final String categoryText;
  final String destinationId;

  CategoryMemoTile(this.categoryText, this.destinationId);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 152,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: tileColor(categoryText),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'ここにテキスト入る',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10.0,
          bottom: 17.0,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.white,
            heroTag: null,
            child: Icon(
              Icons.add,
              size: 38.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Color tileColor(String categoryText) {
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
