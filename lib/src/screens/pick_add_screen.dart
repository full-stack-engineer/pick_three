import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../constants.dart';

class PickAddScreen extends StatelessWidget {
  static const String id = 'pick_add_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Type1'),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter',
                      ),
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
              Text('Type2'),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter',
                      ),
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
              Text('Type3'),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: TextField(
                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter',
                      ),
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
                  onPressed: () {},
                  child: Text(
                    'Submit',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
