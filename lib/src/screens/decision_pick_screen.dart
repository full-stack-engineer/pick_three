import 'package:flutter/material.dart';
import 'package:pickthree/src/components/category_tile.dart';
import 'package:pickthree/src/models/category_data.dart';
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
            children: [
              Consumer<CategoryData>(
                builder: (context, categoryData, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: CategoryTile(categoryData.pickedCategories[0]),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: CategoryTile(categoryData.pickedCategories[1]),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: CategoryTile(categoryData.pickedCategories[2]),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
