import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final EdgeInsets margin;
  final TextEditingController controller;
  final String hint;
  TextFieldWidget({this.margin, this.controller, this.hint = ''});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(color: Colors.black26, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
