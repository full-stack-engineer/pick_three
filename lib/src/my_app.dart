import 'package:flutter/material.dart';
import 'package:pickthree/src/screens/decision_pick_screen.dart';
import 'package:pickthree/src/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick-Three',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        DecisionPickScreen.id: (context) => DecisionPickScreen(),
      },
    );
  }
}