import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:zanaatapp/model/product_data.dart';
import 'package:zanaatapp/widgets/product_location_list.dart';

class ProductLocationScreen extends StatefulWidget {
  static final String id = 'product_location_screen';

  final String appBarProductName;

  ProductLocationScreen({this.appBarProductName});

  @override
  _ProductLocationScreenState createState() => _ProductLocationScreenState();
}

class _ProductLocationScreenState extends State<ProductLocationScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getMessages();
    turnOffSpinner();
  }

  final _firestore = Firestore.instance;
  bool showSpinner = true;
  int city = 0;
  int availableProducts;
  List availableInLocations = [];

  getMessages() async {
    try {
      for (int k = 0; k < 7; k++) {
        final doc = await _firestore
            .collection('${widget.appBarProductName}')
            .document(locations[city])
            .collection('products')
            .getDocuments();

        for (int i = 0; i <= doc.documents.length; i++) {
          availableProducts = i;
        }
        availableInLocations.add(availableProducts);
//        print({locations[city], availableProducts});
        city++;
      }
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  turnOffSpinner() {
    Timer(Duration(seconds: 4), () {
      setState(() {
        showSpinner = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    print(widget.appBarProductName);
    return ModalProgressHUD(
      opacity: 1.0,
      progressIndicator: CircularProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueGrey),
      ),
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(
            color: Color.fromRGBO(112, 112, 112, 1),
          ),
          title: Text(
            widget.appBarProductName,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(112, 112, 112, 1),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                // height: 40.0,
                child: Text(
                  'Üreticilerin Buluduğu İller',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(112, 112, 112, 1),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 10),
              ProductLocationList(
                  widget.appBarProductName, availableInLocations),
            ],
          ),
        ),
      ),
    );
  }
}
