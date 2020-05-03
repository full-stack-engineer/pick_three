//import 'dart:math';
//
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import '../models/category_data.dart';
//import '../constants.dart';
//
//class TypeRow extends StatelessWidget {
//  final String typeText;
//  final _firestore = Firestore.instance;
//
//  TypeRow(this.typeText);
//
//  final typeTextController = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: [
//        Text(typeText),
//        Row(
//          children: <Widget>[
//            Expanded(
//              flex: 3,
//              child: TextField(
//                controller: typeTextController,
//                decoration: kTextFieldDecoration.copyWith(
//                  hintText: 'Enter',
//                ),
//                onChanged: (newValue) {
//                  Provider.of<CategoryData>(context, listen: false)
//                      .addTypeText(newValue);
//                },
//              ),
//            ),
//            SizedBox(width: 5),
//            Expanded(
//              flex: 1,
//              child: RaisedButton(
//                onPressed: () {},
//                child: Icon(Icons.history),
//              ),
//            ),
//            SizedBox(width: 5),
//            Expanded(
//              flex: 1,
//              child: RaisedButton(
//                onPressed: () {
//                  _firestore
//                      .collection(typeText)
//                      .getDocuments()
//                      .then((QuerySnapshot snapshot) {
//                    int randomNum = Random().nextInt(snapshot.documents.length);
//                    typeTextController.text =
//                        snapshot.documents[randomNum].data['text'];
//                  });
//                },
//                child: Icon(Icons.shuffle),
//              ),
//            ),
//          ],
//        ),
//      ],
//    );
//  }
//}
