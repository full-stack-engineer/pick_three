import 'package:flutter/material.dart';
import 'package:pickthree/src/components/category_tile.dart';
import 'package:pickthree/src/models/category_data.dart';
import 'package:pickthree/src/screens/pick_three_screen.dart';
import 'package:provider/provider.dart';

class DecisionPickScreen extends StatelessWidget {
  static const id = 'decision_pick_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  '3つのカテゴリが\nピックアップされました',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Consumer<CategoryData>(
                  builder: (context, categoryData, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Hero(
                          child: CategoryTile(
                            categoryText: categoryData.pickedCategories[0],
                            hasPressed: false,
                          ),
                          tag: '0',
                        ),
                        SizedBox(height: 20),
                        Hero(
                          child: CategoryTile(
                            categoryText: categoryData.pickedCategories[1],
                            hasPressed: false,
                          ),
                          tag: '1',
                        ),
                        SizedBox(height: 20),
                        Hero(
                          child: CategoryTile(
                            categoryText: categoryData.pickedCategories[2],
                            hasPressed: false,
                          ),
                          tag: '2',
                        ),
                        SizedBox(height: 80),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, PickThreeScreen.id);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
