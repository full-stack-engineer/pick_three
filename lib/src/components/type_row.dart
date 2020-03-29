import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/type_data.dart';
import '../constants.dart';

class TypeRow extends StatelessWidget {
  final String typeText;

  TypeRow(this.typeText);

  final typeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(typeText),
        Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: TextField(
                controller: typeTextController,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter',
                ),
                onChanged: (newValue) {
                  Provider.of<TypeData>(context, listen: false)
                      .addTypeText(newValue);
                },
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: RaisedButton(
                onPressed: () {},
                child: Icon(Icons.history),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: RaisedButton(
                onPressed: () {},
                child: Icon(Icons.shuffle),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
