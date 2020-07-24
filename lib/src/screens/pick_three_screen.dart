import 'package:flutter/material.dart';
import 'package:pickthree/src/components/category_memo_tile.dart';
import 'package:pickthree/src/extensions/hex_color.dart';
import 'package:provider/provider.dart';
import 'package:pickthree/src/models/category_data.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

import 'history_screen.dart';

class PickThreeScreen extends StatefulWidget {
  static const id = 'pick_three_screen';

  @override
  _PickThreeScreenState createState() => _PickThreeScreenState();
}

class _PickThreeScreenState extends State<PickThreeScreen> {
  PageController _pageController;
  PageIndicatorLayout layout = PageIndicatorLayout.SLIDE;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: PageView(
                controller: _pageController,
                children: [
                  Container(
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
                                      categoryText:
                                          categoryData.pickedCategories[0],
                                      index: 0,
                                    ),
                                    tag: '0',
                                  ),
                                  SizedBox(height: 20),
                                  Hero(
                                    child: CategoryMemoTile(
                                      categoryText:
                                          categoryData.pickedCategories[1],
                                      index: 1,
                                    ),
                                    tag: '1',
                                  ),
                                  SizedBox(height: 20),
                                  Hero(
                                    child: CategoryMemoTile(
                                      categoryText:
                                          categoryData.pickedCategories[2],
                                      index: 2,
                                    ),
                                    tag: '2',
                                  ),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  HistoryScreen(),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: PageIndicator(
                    layout: layout,
                    size: 8.0,
                    activeSize: 8.0,
                    color: HexColor.fromHex('#DDDDDD'),
                    activeColor: HexColor.fromHex('#333333'),
                    controller: _pageController,
                    space: 8.0,
                    count: 3,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
