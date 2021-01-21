import 'package:flutter/material.dart';

class HomeTopBarNewClassDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraint) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: constraint.maxHeight,
                  width: constraint.maxWidth * 0.5,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          child: Container(
                        width: constraint.maxWidth * 0.5,
                        height: constraint.maxHeight * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                      )),
                      Positioned(
                          child: Container(
                        width: constraint.maxWidth * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            circle(constraint, Colors.transparent, false),
                            circle(constraint, Colors.grey, true),
                            circle(constraint, Colors.grey, true),
                            circle(constraint, Colors.grey, false),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ));
  }

  circle(BoxConstraints constraint, Color color, bool check) => Container(
        height: constraint.maxHeight * 0.5,
        width: constraint.maxHeight * 0.5,
        padding: EdgeInsets.all(constraint.maxHeight * 0.1),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(100)),
        child: Container(
          decoration: BoxDecoration(
              color: check ? Colors.green : color,
              borderRadius: BorderRadius.circular(100)),
        ),
      );
}
