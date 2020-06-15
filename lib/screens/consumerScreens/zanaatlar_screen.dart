import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ZanaatlarScreen extends StatelessWidget {
  static final String id = 'zanaatlar_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
//          color: Color.fromRGBO(112, 112, 112, 1),
        ),
        title: Text(
          'Zanaatlar',
          style: TextStyle(
              fontSize: 22.0, fontWeight: FontWeight.w500, color: Colors.white
//            color: Color.fromRGBO(112, 112, 112, 1),
              ),
        ),
        elevation: 2,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 40),
                  Icon(
                    FontAwesomeIcons.hammer,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 50),
                  Container(
                    height: 48,
                    width: 120,
//                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      'Marangozluk Eğitimleri',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ), //Marangozluk
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 40),
                  Icon(
                    FontAwesomeIcons.crop,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 50),
                  Container(
                    height: 48,
                    width: 120,
//                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      'Dokumacılık Eğitimleri',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ), // Dokumacilik
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 40),
                  Icon(
                    FontAwesomeIcons.solidHourglass,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 50),
                  Container(
                    height: 25,
                    width: 120,
//                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      'Kil Çalışmaları',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ), //Kil calismalari
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 40),
                  Icon(
                    FontAwesomeIcons.handsHelping,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 50),
                  Container(
                    height: 48,
                    width: 120,
//                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      'Geleneksel El Sanatları',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ), //Geleneksel el sanatlari
          ],
        ),
      ),
    );
  }
}
