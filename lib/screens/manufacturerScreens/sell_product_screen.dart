import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zanaatapp/components/rectangle_button.dart';
import 'package:zanaatapp/constants/constants.dart';
import 'package:zanaatapp/model/product_data.dart';
import 'package:zanaatapp/screens/manufacturerScreens/manufacturer_processes_screen.dart';
import 'package:zanaatapp/screens/manufacturerScreens/manufacturer_screen.dart';

class SellProductScreen extends StatefulWidget {
  static final id = 'sell_product_screen';

  final userName;
  final compName;
  SellProductScreen(
    this.userName,
    this.compName,
  );

  @override
  _SellProductScreenState createState() => _SellProductScreenState();
}

class _SellProductScreenState extends State<SellProductScreen> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;

  FirebaseUser loggedInUser;

  bool switchCategory = true;
  String locationName;
  String categoryDropDown;
  String categorySubList;
  String sellerPicture;
  String mUnit;
  String productDescription;
  String productAmount;
  String productName;
  String price;
  String nameSurname;
  String companyName;
  String productPicture;

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
        nameSurname = widget.userName;
        companyName = widget.compName;

//        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  showValidateFormAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text('Uyarı'),
            content: Text('Ürün Açıklaması Boş Bırakılamaz.'),
          );
        });
  }

  showSuccessAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text('Uyarı'),
            content: Container(
              width: 300,
              height: 100,
              child: Column(
                children: <Widget>[
                  Text('Ürününüz başarıyla listelendi.'),
                  SizedBox(height: 15.0),
                  FlatButton(
                    color: Colors.blueGrey,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ManufacturerProcessesScreen.id);
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
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromRGBO(112, 112, 112, 1),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Ürün Sat',
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Text('İl Seçiniz:'),
                      SizedBox(height: 29),
                      Text('Kategori Seçiniz:'),
                      SizedBox(height: 29),
                      Text('Tür:'),
                      SizedBox(height: 29),
                      Text('Ürün Adı:'),
                      SizedBox(height: 29),
                      Text('Resim Ekle:'),
                      SizedBox(height: 29),
                      Text('Üretici Resmi:'),
                      SizedBox(height: 29),
                      Text('Adet/ Kg:'),
                      SizedBox(height: 29),
                      Text('Fiyat:'),
                    ],
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      DropdownButton(
                        hint: Text('İl Adi'),
                        value: locationName,
                        items: getLocationItem(),
                        onChanged: (value) {
                          setState(() {
                            locationName = value;
                          });
                        },
                      ), //Il
                      DropdownButton(
                        hint: Text('Kategori'),
                        value: categoryDropDown,
                        items: [
                          DropdownMenuItem(
                            child: Text('Gıda'),
                            value: 'Gıda',
                          ),
                          DropdownMenuItem(
                            child: Text('El Sanatları'),
                            value: 'El Sanatları',
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            categoryDropDown = value;
                            if (categoryDropDown == 'Gıda') {
                              categorySubList = gidaList[0];

                              switchCategory = true;
                            } else {
                              categorySubList = elSanatlariList[0];
                              switchCategory = false;
                            }
                          });
                        },
                      ), //Kategori
                      DropdownButton(
                        hint: Text('Tür Seçiniz'),
                        value: categorySubList,
                        items: getSubList(switchCategory),
                        onChanged: (value) {
                          setState(() {
                            categorySubList = value;
                          });
                        },
                      ), //Tur
                      SizedBox(
                        width: 100,
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              hintText: 'Örn. Nohut',
                              contentPadding: EdgeInsets.all(6.5),
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300])),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54))
//border: InputBorder.none
                              ),
                          onChanged: (value) {
                            productName = value;
//Do something with the user input.
                          },
                        ),
                      ), //Urun Adi
                      DropdownButton(
                        hint: Text('Resim Ekleyin'),
                        value: productPicture,
                        items: getProductPictures(),
                        onChanged: (value) {
                          setState(() {
                            productPicture = value;
                          });
                        },
                      ), //Resim Ekle
                      DropdownButton(
                        hint: Text('Resim Ekleyin'),
                        value: sellerPicture,
                        items: [
                          DropdownMenuItem(
                            child: Text('Amca'),
                            value: 'Amca',
                          ),
                          DropdownMenuItem(
                            child: Text('Teyze'),
                            value: 'Teyze',
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            sellerPicture = value;
                          });
                        },
                      ), //Uretıcı Resmı

                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                            child: TextField(
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                                WhitelistingTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                  hintText: '*10',
                                  contentPadding: EdgeInsets.all(6.5),
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey[300])),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black54))
//border: InputBorder.none
                                  ),
                              onChanged: (value) {
                                productAmount = value;
//Do something with the user input.
                              },
                            ),
                          ), //adet input field
                          DropdownButton(
                            hint: Text('Adet'),
                            value: mUnit,
                            items: [
                              DropdownMenuItem(
                                child: Text('Adet'),
                                value: 'Adet',
                              ),
                              DropdownMenuItem(
                                child: Text('Kg'),
                                value: 'Kg',
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                mUnit = value;
                              });
                            },
                          ),
                        ],
                      ), //Adet input field and dropdownButton
                      SizedBox(
                        width: 150,
                        child: TextField(
                          textAlign: TextAlign.left,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5),
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                              suffix: Text(
                                '₺',
                                style: TextStyle(color: Colors.black),
                              ),
                              hintText: '*Birim fiyatı:  20 ',
                              contentPadding: EdgeInsets.all(6.5),
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300])),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black54))
//border: InputBorder.none
                              ),
                          onChanged: (value) {
                            price = value;

//Do something with the user input.
                          },
                        ),
                      ), //fiyat
                    ],
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Ürün Açıklaması',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ), //text field header
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
//                  color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 0.4),
                    ),
                    height: 250,
                    width: 250,
                    child: TextField(
                      maxLines: null,
                      textAlign: TextAlign.left,
                      onChanged: (value) {
                        productDescription = value;

//Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration.copyWith(
                          hintText: 'Ürün Açıklaması Girin.'),
                    ),
                  ), //text input field
                  SizedBox(height: 10.0),
                  RectangleButton(
                    minWidthDouble: 250,
                    title: 'Onayla',
                    onPressed: () {
                      print({
                        nameSurname,
                        loggedInUser.displayName,
                        loggedInUser.photoUrl,
                        locationName,
                        categoryDropDown,
                        categorySubList,
                        productName,
                        productAmount + mUnit,
                        productDescription,
                        loggedInUser.email,
                        nameSurname,
                        companyName,
                        price,
                        productPicture,
                        sellerPicture,
                      });
                      _firestore
                          .collection('$categorySubList')
                          .document('$locationName')
                          .collection('products')
                          .add({
                        'nameSurname': loggedInUser.displayName,
                        'companyName': loggedInUser.photoUrl,
                        'category': categoryDropDown,
                        'locationName': locationName,
                        'mUnit': mUnit,
                        'productAmount': productAmount,
                        'productDesc': productDescription,
                        'productName': productName,
                        'productPicture': productPicture,
                        'sellerPicture': sellerPicture,
                        'price': price,
                        'seller': loggedInUser.email,
                        'subCategory': categorySubList,
                      });

                      if (productDescription != null) {
                        showSuccessAlert(context);
                      } else {
                        showValidateFormAlert(context);
                      }
                    },
                  ),
                ],
              ), //urun aciklamasi
            ],
          ),
        ),
      ),
    );
  }
}
