import 'package:flutter/material.dart';
import 'package:pickthree/src/models/type_data.dart';
import 'package:provider/provider.dart';
import 'src/my_app.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TypeData()),
      ],
      child: MyApp(),
    ),
  );
}
