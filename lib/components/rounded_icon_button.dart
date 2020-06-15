import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final String iconTitle;
  final IconData iconData;
  final Function onPressed;
  final Color color;

  RoundedIconButton(
      {this.iconTitle, this.iconData, this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
          disabledColor: Colors.white70,
          minWidth: 0.0,
//          color: color,
//          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              Icon(
                iconData,
                color: Colors.black54,
              ),
              SizedBox(height: 4),
              Text(
                iconTitle,
                style: TextStyle(
                  color: Color.fromRGBO(112, 112, 112, 1),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 8,
                child: Container(
                  width: 120,
                  margin: EdgeInsetsDirectional.only(),
                  color: color,
                ),
              ),
            ],
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
