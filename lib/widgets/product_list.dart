import 'package:flutter/material.dart';
import 'package:zanaatapp/model/category_data.dart';
import 'package:zanaatapp/screens/consumerScreens/product_location_screen.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryData>(builder: (context, productListData, child) {
      return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: productListData.activeList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(5, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProductLocationScreen(
                            appBarProductName:
                                productListData.activeList[index],
                          );
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    width: double.infinity,
                    child: ListTile(
                      title: Text(
                        '${productListData.activeList[index]}',
                        textAlign: TextAlign.left,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
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
