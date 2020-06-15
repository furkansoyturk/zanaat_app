import 'package:flutter/material.dart';

class RoundedCardButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  RoundedCardButton({this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: Material(
//        color: Colors.white,
//        color: Color.fromRGBO(246, 247, 249, 1),
        color: Colors.white.withOpacity(0.87),
        elevation: 5,
        borderRadius: BorderRadius.circular(8),
        child: MaterialButton(
          minWidth: 130.0,
          height: 60.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
//              color: Color.fromRGBO(112, 112, 112, 1),
//              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
