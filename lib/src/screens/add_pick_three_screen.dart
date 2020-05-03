import 'package:flutter/material.dart';
import 'package:pickthree/src/components/category_memo_tile.dart';
import 'package:provider/provider.dart';
import '../models/category_data.dart';

class AddPickThreeScreen extends StatelessWidget {
  static const id = 'add_pick_three_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                'メモ',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Consumer<CategoryData>(
                builder: (context, categoryData, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Hero(
                        child: CategoryMemoTile(
                          categoryData.pickedCategories[0],
                          'hoge',
                        ),
                        tag: 'first',
                      ),
                      SizedBox(height: 20),
                      Hero(
                        child: CategoryMemoTile(
                          categoryData.pickedCategories[1],
                          'hoge',
                        ),
                        tag: 'second',
                      ),
                      SizedBox(height: 20),
                      Hero(
                        child: CategoryMemoTile(
                          categoryData.pickedCategories[2],
                          'hoge',
                        ),
                        tag: 'third',
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}