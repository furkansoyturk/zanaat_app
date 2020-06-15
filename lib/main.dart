import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zanaatapp/model/category_data.dart';
import 'package:zanaatapp/model/product_location_data.dart';
import 'package:zanaatapp/screens/consumerScreens/categories_screen.dart';
import 'package:zanaatapp/screens/consumerScreens/ozel_egitim_screen.dart';
import 'package:zanaatapp/screens/consumerScreens/zanaatlar_screen.dart';
import 'package:zanaatapp/screens/login_or_register_screen.dart';
import 'package:zanaatapp/screens/manufacturerScreens/manufacturer_screen.dart';
import 'package:zanaatapp/screens/consumerScreens/product_list_screen.dart';
import 'package:zanaatapp/screens/login_screen.dart';
import 'package:zanaatapp/screens/consumerScreens/product_location_screen.dart';
import 'package:zanaatapp/screens/registration_screen.dart';
import 'package:zanaatapp/screens/manufacturerScreens/manufacturer_processes_screen.dart';
import 'package:zanaatapp/screens/welcome_screen.dart';
import 'screens/consumerScreens/showProductsScreen.dart';

void main() {
  runApp(ZanaatApp());
}

class ZanaatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryData()),
        ChangeNotifierProvider(create: (context) => ProductLocationData()),
      ],
      child: MaterialApp(
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
          CategoriesScreen.id: (context) => CategoriesScreen(),
          ProductListScreen.id: (context) => ProductListScreen(),
          ProductLocationScreen.id: (context) => ProductLocationScreen(),
          LoginOrRegisterScreen.id: (context) => LoginOrRegisterScreen(),
          ManufacturerScreen.id: (context) => ManufacturerScreen(),
          ManufacturerProcessesScreen.id: (context) =>
              ManufacturerProcessesScreen(),
//          SellProductScreen.id: (context) => SellProductScreen(),
          ShowProductsScreen.id: (context) => ShowProductsScreen(),
          OzelEgitimScreen.id: (context) => OzelEgitimScreen(),
          ZanaatlarScreen.id: (context) => ZanaatlarScreen(),
        },
      ),
    );
  }
}
//return ChangeNotifierProvider(
//      create: (context) => CategoryData(),
