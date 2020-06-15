import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowProductsScreen extends StatelessWidget {
  static final id = 'show_product_screen';

//  final _firestore = Firestore.instance;

  final String appBarLocationName;
  final String productName;
//  var data;
  ShowProductsScreen({this.appBarLocationName, this.productName});

//  void getMessages() async {
//    final doc = await _firestore
//        .collection('Kuruyemiş')
//        .document('Bursa')
//        .collection('products')
//        .getDocuments();
//    for (int i = 0; i <= doc.documents.length; i++) {
//      data = i;
//    }
//
//    print({'denemes', data});
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromRGBO(112, 112, 112, 1),
        ),
        title: Text(
          appBarLocationName,
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
                'Satılan Ürünler',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(112, 112, 112, 1),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Divider(thickness: 1),
            ProductsStream(productName, appBarLocationName),
          ],
        ),
      ),
    );
  }
}

class ProductsStream extends StatelessWidget {
  final _firestore = Firestore.instance;
  final collectionName;
  final appBarLocationName;

  ProductsStream(
    this.collectionName,
    this.appBarLocationName,
  );

  @override
  Widget build(BuildContext context) {
    print(appBarLocationName);
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection('$collectionName')
          .document('$appBarLocationName')
          .collection('products')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
            ),
          );
        }
        final products = snapshot.data.documents;
        List<ProductCard> productList = [];
        for (var product in products) {
          final productDescription = product.data['productDesc'];
          final productName = product.data['productName'];
          final productAmount = product.data['productAmount'];
          final productPicture = product.data['productPicture'];
          final mUnit = product.data['mUnit'];
          final seller = product.data['seller'];
          final companyName = product.data['companyName'];
          final price = product.data['price'];
          final sellerPicture = product.data['sellerPicture'];
//          final nameSurname = product.data['nameSurname'];

          final productListItem = ProductCard(
            productName: productName,
            productDescription: productDescription,
            productAmount: productAmount,
            productPicture: productPicture,
            mUnit: mUnit,
            seller: seller,
            companyName: companyName,
            price: price,
            sellerPicture: sellerPicture,
          );

          productList.add(productListItem);
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: productList,
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({
    this.productName,
    this.productDescription,
    this.productAmount,
    this.productPicture,
    this.mUnit,
    this.seller,
    this.companyName,
    this.price,
    this.sellerPicture,
  });

  final String productName;
  final String productDescription;
  final String productAmount;
  final String seller;
  final String mUnit;
  final String companyName;
  final String price;
  final String sellerPicture;
  final String productPicture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
//                color: Colors.red,
//                border: Border.all(),
//                borderRadius: BorderRadius.circular(40.0),
                ),
          ),
          Positioned(
            left: 175,
            top: 10,
            child: Text(
              '$productName',
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
          ), //productName
          Positioned(
            top: 5,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: AssetImage('images/$productPicture.png'),
//                image: NetworkImage(
//                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                height: 110,
                width: 110,
              ),
            ),
          ), //productImage
          Positioned(
            top: 10,
            left: 140,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: Container(
                width: 120,
                height: 130,
                child: Text(
                  ' $productDescription',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
            ),
          ), //Product Description
          Positioned(
            top: 160,
            left: 0,
            child: Container(
              width: 80,
              height: 20,
//                color: Colors.blueGrey,
              child: Text(
                'Üretici',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          ), //Seller Header
          Positioned(
            top: 200,
            left: 25,
            child: Container(
              width: 50,
              height: 40,
//                color: Colors.blueGrey,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  image: AssetImage('images/$sellerPicture.png'),
//                image: NetworkImage(
//                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  height: 110,
                  width: 110,
                ),
              ),
            ),
          ), //Seller Header
          Positioned(
            top: 176,
            left: 0,
            child: SizedBox(
              height: 0.7,
              child: Container(
                width: 50,
                margin: EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                height: 5.0,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 180,
            left: 15,
            child: Text(
              '$companyName',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
          ), //Seller Name
          Positioned(
            top: 190,
            left: 190,
            child: Text(
              '$price ₺',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ), //Price
          Positioned(
            top: 193,
            left: 255,
            child: Icon(
              Icons.add_shopping_cart,
              size: 20,
              color: Colors.black54,
            ),
          ), //Add shopping cart icon
          Positioned(
            top: 215,
            left: 180,
            child: Text(
              'Stok: $productAmount $mUnit ',
              style: TextStyle(
                fontSize: 10.0,
              ),
            ),
          ), //mUnit & productAmount
          Positioned(
            top: 250,
            child: SizedBox(
              height: 0.2,
              child: Container(
                width: 260,
                margin: EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                height: 5.0,
                color: Colors.black,
              ),
            ),
          ), //Divider
        ],
      ),
    );
  }
}
