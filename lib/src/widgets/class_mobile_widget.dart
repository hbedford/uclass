import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/class.dart';

class ClassMobileWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final Class classe;
  ClassMobileWidget({this.classe, @required this.constraint});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: constraint.maxHeight * 0.05,
          left: constraint.maxWidth * 0.02,
          bottom: constraint.maxHeight * 0.1),
      width: constraint.maxWidth * 0.5,
      decoration: BoxDecoration(
          color: classe.color.value, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(),
          Text(
            classe.name.value,
            /* style: style, */
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Prof:${classe.teacher.value.name.value}',
                style: TextStyle(fontSize: 10),
              ),
              Text(
                'Participantes:${classe.members.value.length}',
                style: TextStyle(fontSize: 10),
              ),
            ],
          )
        ],
      ),
    );
  }
}
