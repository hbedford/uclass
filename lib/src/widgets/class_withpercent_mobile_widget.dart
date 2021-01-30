import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/class.dart';

class ClassWithPercentMobileWidget extends StatelessWidget {
  final Class classe;
  final BoxConstraints constraint;
  ClassWithPercentMobileWidget({this.classe, @required this.constraint});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: constraint.maxWidth * 0.02,
      ),
      width: constraint.maxWidth * 0.5,
      height: constraint.maxHeight * 0.15,
      decoration: BoxDecoration(
          color: classe.color.value, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: constraint.maxHeight * 0.03,
            width: constraint.maxWidth,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Row(
                    children: [
                      Container(
                        height: constraint.maxHeight * 0.03,
                        width: (constraint.maxWidth * 0.5) *
                            (classe.percent.value / 10),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                      ),
                      Container(
                        height: constraint.maxHeight * 0.03,
                        width: (constraint.maxWidth * 0.5) *
                            ((10 - classe.percent.value) / 10),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20))),
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Progresso',
                        /*     style: style, */
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(),
                Text(
                  classe.name.value,
                  /* style: style, */
                ),
                Text(
                  'Participantes:${classe.members.value.length}',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
