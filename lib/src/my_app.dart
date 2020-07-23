import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pickthree/src/screens/add_detail_text_screen.dart';
import 'package:pickthree/src/screens/pick_three_screen.dart';
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
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case HomeScreen.id:
            return PageTransition(
              child: HomeScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case DecisionPickScreen.id:
            return PageTransition(
              child: DecisionPickScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case PickThreeScreen.id:
            return PageTransition(
              child: PickThreeScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case AddDetailTextScreen.id:
            return PageTransition(
              child: AddDetailTextScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          default:
            return null;
        }
      },
    );
  }
}