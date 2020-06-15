import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:zanaatapp/components/rectangle_button.dart';
import 'package:zanaatapp/model/category_data.dart';
import 'package:zanaatapp/screens/consumerScreens/product_list_screen.dart';
import 'package:zanaatapp/screens/manufacturerScreens/sell_product_screen.dart';

class ManufacturerProcessesScreen extends StatefulWidget {
  static final id = 'manufacturer_processes_screen';

  ManufacturerProcessesScreen({this.nameSurname, this.companyName});

  final nameSurname;
  final companyName;

  @override
  _ManufacturerProcessesScreenState createState() =>
      _ManufacturerProcessesScreenState();
}

class _ManufacturerProcessesScreenState
    extends State<ManufacturerProcessesScreen> {
  final _auth = FirebaseAuth.instance;

  FirebaseUser loggedInUser;
  bool showSpinner = false;
  bool showName;
  String userName;
  String companyName;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();

      if (user != null) {
        loggedInUser = user;
        userName = loggedInUser.displayName;

        print(loggedInUser.displayName);
        print(loggedInUser.email);

        if (loggedInUser.displayName == null) {
          userName = widget.nameSurname;
          companyName = widget.companyName;
        }

        setState(() {
          showSpinner = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  ureticiPuan(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text('Üretici Puanı'),
            content: Container(
              width: 300,
              height: 150,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star),
                      Icon(Icons.star_half),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Ortalama Puan: 4,5',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 15.0),
                  FlatButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Tamam',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  cuzdan(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text('Üretici Cüzdanı'),
            content: Container(
              width: 350,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20),
                  Text(
                    'Vergi Numarası: #4424',
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Satış Geliri: 424 ₺',
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Listelenen Ürün Sayısı: 4',
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tamamlanan Satış Sayısı: 6',
                    style: TextStyle(fontSize: 13.0),
                  ),
                  SizedBox(height: 25.0),
                  FlatButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Tamam',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(builder: (context, productListData, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Text(
            'Üretici İşlemleri',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
          ),
          inAsyncCall: showSpinner,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Hosgeldiniz $userName',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                RectangleButton(
                  title: 'Ürün Sat',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SellProductScreen(
                            loggedInUser.displayName, loggedInUser.photoUrl);
                      }),
                    );
                  },
                ),
                RectangleButton(
                  title: 'Ürünler',
                  onPressed: () {
                    getCurrentUser();
                    productListData.showedCategory('gida');
                    Navigator.pushNamed(context, ProductListScreen.id);
                  },
                ),
                RectangleButton(
                  title: 'Üretici Puanı',
                  onPressed: () {
                    ureticiPuan(context);
                  },
                ),
                RectangleButton(
                  title: 'Cüzdan',
                  onPressed: () {
                    cuzdan(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
