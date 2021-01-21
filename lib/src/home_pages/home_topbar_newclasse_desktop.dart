import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/classes/classes_controller.dart';

class HomeTopBarNewClassDesktop extends StatelessWidget {
  final controller = GetIt.I.get<ClassesController>();
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
                        child: ValueListenableBuilder(
                          valueListenable: controller.step,
                          builder: (_, value, child) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              circle(constraint, Colors.transparent, false),
                              circle(constraint, Colors.grey, value >= 1),
                              circle(constraint, Colors.grey, value >= 2),
                              circle(constraint, Colors.grey, value >= 3),
                            ],
                          ),
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
