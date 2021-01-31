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
          top: constraint.maxHeight * 0.05,
          bottom: constraint.maxHeight * 0.1),
      width: constraint.maxWidth * 0.5,
      height: constraint.maxHeight * 0.15,
      decoration: BoxDecoration(
          color: classe.color.value, borderRadius: BorderRadius.circular(10)),
      child: LayoutBuilder(
        builder: (_, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: constraints.maxHeight * 0.2,
              width: constraints.maxWidth,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      height: constraint.maxHeight,
                      width: constraint.maxWidth,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: constraint.maxHeight,
                          width: (constraint.maxWidth * 0.5) *
                              (classe.percent.value / 10),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                              )),
                        ),
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
      ),
    );
  }
}
