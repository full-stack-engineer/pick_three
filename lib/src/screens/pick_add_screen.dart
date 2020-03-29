import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pickthree/src/helpers/database_helper.dart';
import 'package:pickthree/src/models/type_data.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import '../components/type_row.dart';

class PickAddScreen extends StatelessWidget {
  static const String id = 'pick_add_screen';
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
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
                TypeRow(),
                SizedBox(
                  height: 20,
                ),
                Text(type.types[1]),
                TypeRow(),
                SizedBox(
                  height: 20,
                ),
                Text(type.types[2]),
                TypeRow(),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      insert(type.types, type.typeTexts);
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

  void insert(List<String> types, List<String> typeTexts) async {
    for (int i = 0; i < 3; i++) {
      Map<String, dynamic> row = {
        DatabaseHelper.columnType: types[i],
        DatabaseHelper.columnDesc: typeTexts[i]
      };
      final id = await dbHelper.insert(row);
      print('inserted row id: $id');
    }
  }
}
