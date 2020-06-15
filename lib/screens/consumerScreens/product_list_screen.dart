import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zanaatapp/components/rounded_icon_button.dart';
import 'package:zanaatapp/model/category_data.dart';
import 'package:zanaatapp/widgets/product_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductListScreen extends StatefulWidget {
  static final String id = 'categories_sub_screen';

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(builder: (context, productListData, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
//              horizontal: 5.0,
                ),
            child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RoundedIconButton(
                      iconTitle: 'Gıda',
                      iconData: FontAwesomeIcons.leaf,
                      color: productListData.button1Color,
                      onPressed: () {
                        productListData.showedCategory('gida');
                      },
                    ),
                    RoundedIconButton(
                      iconTitle: 'El Sanatları',
                      iconData: FontAwesomeIcons.handsHelping,
                      color: productListData.button2Color,
                      onPressed: () {
                        productListData.showedCategory('elSanatlari');
                      },
                    ),
//                    RoundedIconButton(
//                      iconTitle: 'Özel Ders',
//                      iconData: FontAwesomeIcons.fileSignature,
//                      color: productListData.button3Color,
//                      onPressed: () {
//                        productListData.showedCategory('ozelDers');
//                      },
//                    ),
//                    RoundedIconButton(
//                      iconTitle: 'Zanaatlar',
//                      iconData: FontAwesomeIcons.handHoldingWater,
//                      color: productListData.button4Color,
//                      onPressed: () {
//                        productListData.showedCategory('zanaatlar');
//                      },
//                    ),
                  ],
                ),
//                Divider(
//                  thickness: 3.0,
//                ),
                SizedBox(height: 10.0),
                ProductList(),
              ],
            )),
      );
    });
//  }
  }
}
