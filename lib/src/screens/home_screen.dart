import 'package:flutter/material.dart';
import '../models/type_data.dart';
import 'package:pickthree/src/screens/pick_add_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム'),
      ),
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
                  Provider.of<TypeData>(context, listen: false).randSetType();
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
