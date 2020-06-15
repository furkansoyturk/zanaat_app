import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  RectangleButton(
      {this.color,
      @required this.title,
      @required this.onPressed,
      this.textColor,
      this.showBorder,
      this.minWidthDouble});

  final Color textColor;
  final Color color;
  final String title;
  final Function onPressed;
  final ShapeBorder showBorder;
  final double minWidthDouble;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
//        elevation: 0.7,
        color: color ?? Colors.white,
        shape: showBorder ?? Border.all(width: 0.6),
//        showBorder ?? Border.all(),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: minWidthDouble ?? 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
