import 'package:flutter/material.dart';
import 'package:pickthree/src/helpers/helper.dart';
import 'package:pickthree/src/models/category_data.dart';
import 'package:pickthree/src/screens/decision_pick_screen.dart';
import 'package:provider/provider.dart';

class CategoryTile extends StatelessWidget {
  final String categoryText;
  final bool hasPressed;

  CategoryTile({this.categoryText, this.hasPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        RaisedButton(
          color: Helper.tileColor(categoryText),
          onPressed: hasPressed ? () {
            Provider.of<CategoryData>(context, listen: false).pickCategory(categoryText);
            if (Provider.of<CategoryData>(context, listen: false).pickThreeCount() == 3) {
              Provider.of<CategoryData>(context, listen: false).resetCategories();
              Navigator.pushNamed(context, DecisionPickScreen.id);
            }
          } : null,
          disabledColor: Helper.tileColor(categoryText),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            height: 64,
            child: Center(
              child: Material(
                color: Colors.transparent,
                child: Text(
                  categoryText,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
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
              color: Color(0xFF333333),
            ),
          ),
        ) : Container(),
      ],
    );
  }
}
