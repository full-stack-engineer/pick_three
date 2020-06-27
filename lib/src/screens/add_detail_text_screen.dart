import 'package:flutter/material.dart';
import 'package:pickthree/src/extensions/hex_color.dart';
import 'package:pickthree/src/helpers/helper.dart';
import 'package:pickthree/src/screens/add_pick_three_screen.dart';
import '../models/category_data.dart';
import 'package:provider/provider.dart';

class AddDetailTextScreen extends StatefulWidget {
  static const id = 'add_detail_text_screen';

  @override
  _AddDetailTextScreenState createState() => _AddDetailTextScreenState();
}

class _AddDetailTextScreenState extends State<AddDetailTextScreen> {
  final textController = TextEditingController();
  String memo;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TextFieldの値を入力後の値にする
    textController.value = textController.value.copyWith(
        text: Provider.of<CategoryData>(context, listen: false).categoryDetailTexts[Provider.of<CategoryData>(context, listen: false).selectedIndex]
    );
    return Consumer<CategoryData>(
      builder: (context, categoryData, child) {
        int selectedIndex = categoryData.selectedIndex;
        String pickedCategory = categoryData.pickedCategories[selectedIndex];
        return Scaffold(
          backgroundColor: Helper.tileColor(pickedCategory),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    if(memo != null) {
                      categoryData.setCategoryDetailText(memo, selectedIndex);
                    }
                    FocusScope.of(context).unfocus();
                    Navigator.pushNamed(context, AddPickThreeScreen.id);
                  },
                  child: Hero(
                    tag: categoryData.heroTag,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 60.0, left: 30.0, right: 30.0, bottom: 100.0),
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            pickedCategory,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                        ),
                        Container(
                          width: 40,
                          height: 4,
                          color: HexColor.fromHex('#DDDDDD'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: TextField(
                            controller: textController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'メモを記入する',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: HexColor.fromHex('#DDDDDD')
                              ),
                            ),
                            onChanged: (newValue) {
                              memo = newValue;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
