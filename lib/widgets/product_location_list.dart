import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zanaatapp/model/product_location_data.dart';
import 'package:zanaatapp/screens/consumerScreens/showProductsScreen.dart';

class ProductLocationList extends StatelessWidget {
  final String appBarProductName;
  final List productNumber;

  ProductLocationList(this.appBarProductName, this.productNumber);

//   bool check ;
//  void checkEmp() {
//    if (productNumber != null) {
//      check = true;
//    } else {
//      check = false;
//    }
//  }

  Widget build(BuildContext context) {
//    checkEmp();
//    print(productNumber);
    return Consumer<ProductLocationData>(
        builder: (context, productLocationData, child) {
      return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: productLocationData.locations.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 1,
                      offset: Offset(5, 1), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FlatButton(
                  onPressed: () {
                    print(appBarProductName);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ShowProductsScreen(
                            productName: appBarProductName,
                            appBarLocationName:
                                productLocationData.locations[index],
                          );
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: ListTile(
                      title: Text(
                        '${productLocationData.locations[index]}',
                        textAlign: TextAlign.left,
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text('${productNumber[index]}'
//                                check ? '${productNumber[index]}' : '$index'
//                              '${widget.productNumber[index]}',
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                  // thickness: 1.0,
                  // endIndent: 20.0,
                  );
            }),
      );
    });
  }
}
