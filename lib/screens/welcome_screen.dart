import 'package:flutter/material.dart';
import 'package:zanaatapp/screens/consumerScreens/categories_screen.dart';
import 'package:zanaatapp/components/rounded_card_button.dart';
import 'package:zanaatapp/screens/login_or_register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static final String id = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 80.0,
          horizontal: 5.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image(
              color: Colors.white,
              image: AssetImage(('images/inAppLogo.png')),
              height: 350,
            ),
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedCardButton(
                  title: 'Üretici',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginOrRegisterScreen.id);
//                    Navigator.pushNamed(context, SellProductScreen.id);
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RoundedCardButton(
                  title: 'Tüketici',
                  onPressed: () {
                    Navigator.pushNamed(context, CategoriesScreen.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
