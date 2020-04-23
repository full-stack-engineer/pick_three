import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import '../models/type_data.dart';
import 'package:pickthree/src/screens/pick_add_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance.initialize(appId: getAppId());
    myBanner
      ..load()
      ..show(
        // ボトムからのオフセットで表示位置を決定
        anchorOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }
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

String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544~1458002511';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544~3347511713';
  }
  return null;
}

// 広告ターゲット
MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or female, unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // テスト用のIDを使用
  // リリース時にはIDを置き換える必要あり
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    // 広告の読み込みが完了
    print("BannerAd event is $event");
  },
);
