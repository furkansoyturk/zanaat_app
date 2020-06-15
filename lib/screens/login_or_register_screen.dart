import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:zanaatapp/components/rounded_button.dart';

class LoginOrRegisterScreen extends StatelessWidget {
  static const String id = 'login_or_register_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
              color: Colors.white,
              height: 350,
              image: AssetImage(('images/inAppLogo.png')),
            ),
            SizedBox(
              height: 5.0,
            ),
            RoundedButton(
              title: 'Giriş Yap',
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
                //Go to login screen.
              },
            ),
            RoundedButton(
              title: 'Kayıt Ol',
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
                //Go to registration screen.
              },
            )
          ],
        ),
      ),
    );
  }
}
