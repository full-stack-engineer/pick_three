import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:pickthree/src/components/category_tile.dart';
import 'package:pickthree/src/models/category_data.dart';
import 'package:provider/provider.dart';
import 'package:pickthree/src/screens/decision_pick_screen.dart';

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
//    FirebaseAdMob.instance.initialize(appId: getAppId());
//    myBanner
//      ..load()
//      ..show(
//        // ボトムからのオフセットで表示位置を決定
//        anchorOffset: 0.0,
//        anchorType: AnchorType.bottom,
//      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('ホーム'),
//      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Text(
                  '3つのカテゴリーを\nピックアップしましょう',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Expanded(
                child: CategoryTile(categoryText: '仕事', hasPressed: true),
              ),
              SizedBox(height: 20),
              Expanded(
                child: CategoryTile(categoryText: '運動', hasPressed: true),
              ),
              SizedBox(height: 20),
              Expanded(
                child: CategoryTile(categoryText: '家庭', hasPressed: true),
              ),
              SizedBox(height: 20),
              Expanded(
                child: CategoryTile(categoryText: '友人', hasPressed: true),
              ),
              SizedBox(height: 20),
              Expanded(
                child: CategoryTile(categoryText: '睡眠', hasPressed: true),
              ),
              SizedBox(height: 30),
              FloatingActionButton(
                onPressed: () {
                  Provider.of<CategoryData>(context, listen: false).randPickCategories();
                  if (Provider.of<CategoryData>(context, listen: false).pickThreeCount() == 3) {
                    Provider.of<CategoryData>(context, listen: false).resetCategories();
                    Navigator.pushNamed(context, DecisionPickScreen.id);
                  }
                },
                backgroundColor: Color(0xFFFFFFFF),
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
  childDirected: false,
  // or female, unknown
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
