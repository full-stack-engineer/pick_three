import 'package:flutter/material.dart';
import 'package:pickthree/src/models/category_data.dart';
import 'package:pickthree/src/screens/decision_pick_screen.dart';
import '../extensions/hex_color.dart';
import 'package:provider/provider.dart';

class CategoryTile extends StatelessWidget {
  final String categoryText;

  CategoryTile(this.categoryText);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        RaisedButton(
          color: tileColor(categoryText),
          onPressed: () {
            Provider.of<CategoryData>(context, listen: false).pickCategory(categoryText);
            if (Provider.of<CategoryData>(context, listen: false).pickThreeCount() == 3) {
              Provider.of<CategoryData>(context, listen: false).resetCategories();
              Navigator.pushNamed(context, DecisionPickScreen.id);
            }
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            height: 64,
            child: Center(
              child: Text(
                categoryText,
                style: TextStyle(
                  color: HexColor.fromHex('#FFFFFF'),
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Provider.of<CategoryData>(context, listen: true).categories[categoryText] ? Positioned(
          right: 10,
          top: -15,
          child: Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: Icon(
              Icons.check,
              color: HexColor.fromHex('#333333'),
            ),
          ),
        ) : Container(),
      ],
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
