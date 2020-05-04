import 'package:flutter/material.dart';
import 'package:pickthree/src/helpers/tile_color.dart';
import 'package:pickthree/src/screens/add_pick_three_screen.dart';
import '../models/category_data.dart';
import 'package:provider/provider.dart';

class AddDetailTextScreen extends StatelessWidget {
  static const id = 'add_detail_text_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(
      builder: (context, categoryData, child) {
        int selectedIndex = categoryData.selectedIndex;
        String pickedCategory = categoryData.pickedCategories[selectedIndex];
        return Scaffold(
          backgroundColor: TileColor.tileColor(pickedCategory),
          body: InkWell(
            onTap: () {
              Navigator.pushNamed(context, AddPickThreeScreen.id);
            },
            child: Hero(
              tag: categoryData.heroTag,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 60.0, left: 30.0, right: 30.0, bottom: 60.0),
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            pickedCategory,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
