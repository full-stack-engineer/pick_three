import 'package:flutter/material.dart';
import 'package:pickthree/src/helpers/helper.dart';

class HistoryTile extends StatelessWidget {
  final String categoryText;

  HistoryTile({this.categoryText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            categoryText,
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 14.0,
            ),
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: 47,
              height: 40,
              decoration: BoxDecoration(
                color: Helper.tileColor(categoryText),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Container(
              width: 47,
              height: 320,
              decoration: BoxDecoration(
                color: Helper.tileBackgroundColor(categoryText),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Text(
              '10',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
