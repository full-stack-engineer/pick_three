import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pickthree/src/models/category_data.dart';
import 'package:provider/provider.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'src/my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryData()),
      ],
      child: MyApp(),
    ),
  );
}
