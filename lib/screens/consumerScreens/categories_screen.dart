import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zanaatapp/components/cat_button.dart';
import 'package:provider/provider.dart';
import 'package:zanaatapp/model/category_data.dart';
import 'package:zanaatapp/screens/consumerScreens/ozel_egitim_screen.dart';
import 'package:zanaatapp/screens/consumerScreens/product_list_screen.dart';
import 'package:zanaatapp/screens/consumerScreens/zanaatlar_screen.dart';

class CategoriesScreen extends StatelessWidget {
  static final String id = 'categories_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(builder: (context, productListData, child) {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Kategoriler',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(112, 112, 112, 1),
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(height: 70.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CatButton(
                        title: 'Gıda',
                        onPress: () {
                          productListData.showedCategory('gida');
                          Navigator.pushNamed(context, ProductListScreen.id);
                        }),
                    SizedBox(height: 30),
                    CatButton(
                        title: 'El Sanatları',
                        onPress: () {
                          productListData.showedCategory('elSanatlari');
                          Navigator.pushNamed(context, ProductListScreen.id);
                        }),
                    SizedBox(height: 30),
                    CatButton(
                        title: 'Özel Eğitim',
                        onPress: () {
//                          productListData.showedCategory('ozelDers');
                          Navigator.pushNamed(context, OzelEgitimScreen.id);
                        }),
                    SizedBox(height: 30),
                    CatButton(
                        title: 'Zanaatlar',
                        onPress: () {
//                          productListData.showedCategory('zanaatlar');
                          Navigator.pushNamed(context, ZanaatlarScreen.id);
                        }),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
