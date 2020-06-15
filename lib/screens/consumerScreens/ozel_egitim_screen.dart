import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OzelEgitimScreen extends StatelessWidget {
  static final String id = 'ozel_egitim_screen';

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
          'Özel Eğitim',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 40),
                  Icon(
                    FontAwesomeIcons.calculator,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 60),
                  Container(
                    height: 20,
                    width: 120,
//                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      'Matematik',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ), //Matematık
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
                    FontAwesomeIcons.paintBrush,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 60),
                  Container(
                    height: 25,
                    width: 120,
//                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      'Resim Dersleri',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ), // Resım derslerı
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
                  SizedBox(width: 60),
                  Container(
                    height: 25,
                    width: 120,
//                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      'El İşi Kursları',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ), //el isi  kurslari
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
                    FontAwesomeIcons.graduationCap,
                    size: 25.0,
                    color: Colors.black54,
                  ),
                  SizedBox(width: 60),
                  Container(
                    height: 25,
                    width: 120,
//                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      'Staj',
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
