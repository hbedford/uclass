import 'package:flutter/material.dart';

class ButtonCheckWidget extends StatelessWidget {
  final EdgeInsets margin;
  final bool check;
  final Function f;
  ButtonCheckWidget({this.margin, this.check, this.f});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: f,
      child: Container(
        width: 15,
        height: 15,
        margin: margin,
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: check ? Colors.green : Colors.transparent,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ),
    );
  }
}
