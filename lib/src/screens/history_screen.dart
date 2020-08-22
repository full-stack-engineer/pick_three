import 'package:flutter/material.dart';
import 'package:pickthree/src/components/history_tile.dart';

class HistoryScreen extends StatelessWidget {
  static const id = 'history_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 54.0, bottom: 24.0, right: 24.0, left: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    'これまでのPick Three',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HistoryTile(
                      categoryText: '仕事',
                    ),
                    HistoryTile(
                      categoryText: '運動',
                    ),
                    HistoryTile(
                      categoryText: '家庭',
                    ),
                    HistoryTile(
                      categoryText: '友人',
                    ),
                    HistoryTile(
                      categoryText: '睡眠',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
