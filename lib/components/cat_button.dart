import 'package:flutter/material.dart';

class CatButton extends StatelessWidget {
  final String title;
  final Function onPress;
  CatButton({this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white70.withOpacity(0.6),
      ),
      child: MaterialButton(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
              fontSize: 18.0,
            ),
          ),
          onPressed: onPress),
    );
  }
}
