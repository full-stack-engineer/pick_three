import 'package:flutter/material.dart';
import 'package:pickthree/src/screens/pick_add_screen.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, PickAddScreen.id);
                },
                child: Text('自分で選ぶ'),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, PickAddScreen.id);
                },
                child: Text('ランダムで選ぶ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
