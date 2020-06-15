import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryData extends ChangeNotifier {
  List<String> gidaList = [
    'Kuruyemiş',
    'Baklagiller',
    'Mevsimlik Ürünler',
    'Konserve',
    'Yöreye Özgü',
  ];

  List<String> elSanatlariList = [
    'El İşi',
    'Bujiteri',
    'Ahşap Ürünler',
    'Seramik',
    'Cam İşlemeler',
  ];

  List<String> ozelDers = [
    'Staj İmkanları',
    'Matematik Dersleri',
    'Resim Calismalari',
    'El İşi kurslari',
  ];

  List<String> zaanatlar = [
    'Dokumacılık',
    'Kil Çalışmaları',
    'İşlemecilik',
    'Marangozluk',
  ];

  List<String> activeList = [];

  Color color;

  Color button1Color;
  Color button2Color;
  Color button3Color;
  Color button4Color;

  void showedCategory(String categoryName) {
    switch (categoryName) {
      case 'gida':
        {
          activeList = gidaList;
          button1Color = Color.fromRGBO(209, 214, 216, 1);
          button2Color = null;
          button3Color = null;
          button4Color = null;
        }
        break;
      case 'elSanatlari':
        {
          activeList = elSanatlariList;

          button2Color = Color.fromRGBO(209, 214, 216, 1);
          button3Color = null;
          button4Color = null;
          button1Color = null;
        }
        break;
      case 'ozelDers':
        {
          activeList = ozelDers;
          button3Color = Color.fromRGBO(209, 214, 216, 1);
          button4Color = null;
          button1Color = null;
          button2Color = null;
        }
        break;
      case 'zanaatlar':
        {
          activeList = zaanatlar;
          button4Color = Color.fromRGBO(209, 214, 216, 1);
          button1Color = null;
          button2Color = null;
          button3Color = null;
        }
    }
    print(categoryName);
    notifyListeners();
  }
}
