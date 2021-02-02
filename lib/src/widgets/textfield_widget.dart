import 'dart:ui';

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final EdgeInsets margin;
  final TextEditingController controller;
  final Function onChange;
  final String hint;
  final Color color;
  final Color hintColor;
  final String error;
  final double height;
  final EdgeInsets padding;
  final double radius;
  final TextStyle hintStyle;
  final TextInputType textInputType;
  final int lines;
  final double width;
  TextFieldWidget(
      {this.margin,
      this.controller,
      this.padding,
      this.error,
      this.height,
      this.radius = 10,
      this.hint = '',
      this.onChange,
      this.hintColor = Colors.black26,
      this.color = Colors.white,
      this.textInputType,
      this.hintStyle,
      this.lines,
      this.width});
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(radius));

    return Container(
      height: height,
      width: width,
      margin: margin,
      /*  padding: padding ?? const EdgeInsets.symmetric(horizontal: 20), */
      /*  decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)), */
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: onChange,
          maxLines: lines,
          keyboardType: textInputType,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border: border,
              errorBorder: border,
              disabledBorder: border,
              enabledBorder: border,
              focusedBorder: border,
              focusedErrorBorder: border,
              hoverColor: color,
              focusColor: color,
              fillColor: color,
              filled: true,
              errorText: error,
              hintText: hint,
              hintStyle: hintStyle ??
                  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Colors.black12)),
        ),
      ),
    );
  }
}
