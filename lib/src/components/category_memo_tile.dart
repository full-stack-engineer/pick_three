import 'package:flutter/material.dart';
import 'package:pickthree/src/screens/add_detail_text_screen.dart';
import 'package:provider/provider.dart';
import '../models/category_data.dart';
import '../helpers/tile_color.dart';

class CategoryMemoTile extends StatelessWidget {
  final String categoryText;
  final int index;

  CategoryMemoTile({this.categoryText, this.index});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            height: 152,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: TileColor.tileColor(categoryText),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      categoryText,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Material(
                    color: Colors.transparent,
                    child: Provider.of<CategoryData>(context, listen: true).categoryDetailTexts[index] != '' ? Text(
                      Provider.of<CategoryData>(context, listen: true).categoryDetailTexts[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ) : Container(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10.0,
            bottom: 17.0,
            child: FloatingActionButton(
              onPressed: () {
                Provider.of<CategoryData>(context, listen: false).setSelectedIndex(index);
                Provider.of<CategoryData>(context, listen: false).setHeroTag(index.toString());
                Navigator.pushNamed(context, AddDetailTextScreen.id);
              },
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
      ),
    );
  }
}
