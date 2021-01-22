import 'package:flutter/material.dart';

class RectangularButtonWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final Function f;
  final String title;
  final Color color;
  final TextStyle style;
  final EdgeInsets padding;
  final EdgeInsets margin;
  RectangularButtonWidget(
      {this.constraint,
      this.margin,
      this.f,
      this.padding,
      this.title,
      this.color,
      this.style = const TextStyle(
          fontFamily: 'Gotham', color: Colors.white, fontSize: 16)});
  /* 
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 20); */
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ??
          EdgeInsets.symmetric(
              horizontal: constraint.maxWidth * 0.05,
              vertical: constraint.maxHeight * 0.002),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      child: InkWell(
        onTap: f,
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
