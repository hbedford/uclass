import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final EdgeInsets margin;
  final TextEditingController controller;
  final String hint;
  final Color color;
  final Color hintColor;
  final double height;
  final EdgeInsets padding;
  TextFieldWidget(
      {this.margin,
      this.controller,
      this.padding,
      this.height,
      this.hint = '',
      this.hintColor = Colors.black26,
      this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: margin,
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  TextStyle(color: hintColor, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
