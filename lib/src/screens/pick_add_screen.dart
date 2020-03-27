import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pickthree/src/helpers/database_helper.dart';
import 'package:pickthree/src/models/type_data.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class PickAddScreen extends StatelessWidget {
  static const String id = 'pick_add_screen';
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    List<String> typeTexts = [];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<TypeData>(builder: (context, type, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(type.types[0]),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter',
                        ),
                        onChanged: (newValue) {
                          typeTexts.add(newValue);
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
                SizedBox(
                  height: 20,
                ),
                Text(type.types[1]),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter',
                        ),
                        onChanged: (newValue) {
                          typeTexts.add(newValue);
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
                SizedBox(
                  height: 20,
                ),
                Text(type.types[2]),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: TextField(
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter',
                        ),
                        onChanged: (newValue) {
                          typeTexts.add(newValue);
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
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      insert(type.types, typeTexts);
                    },
                    child: Text(
                      'Submit',
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void insert(List<String> types, List<String> descs) async {
    for (int i = 0; i < 3; i++) {
      Map<String, dynamic> row = {
        DatabaseHelper.columnType: types[i],
        DatabaseHelper.columnDesc: descs[i]
      };
      final id = await dbHelper.insert(row);
      print('inserted row id: $id');
    }
  }
}
