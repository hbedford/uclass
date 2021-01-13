import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function f;
  final String title;
  final double height;
  final double width;
  final TextStyle style;
  final Color color;
  ButtonWidget(
      {this.f, this.title, this.height, this.width, this.style, this.color});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: color,
        /* padding: EdgeInsets.symmetric(horizontal: width * 0.1), */
        /* shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ), */
        onPressed: f,
        child: Container(
            height: height,
            width: width,
            child: Center(
                child: Text(
              title,
              style: style,
            ))));
  }
}
