import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/class.dart';

class ClassWithPercentDesktopWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final Class classe;
  ClassWithPercentDesktopWidget({@required this.constraint, this.classe});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: constraint.maxWidth * 0.02,
          top: constraint.maxHeight * 0.1,
          bottom: constraint.maxHeight * 0.1),
      width: constraint.maxWidth * 0.2,
      height: constraint.maxHeight * 0.1,
      decoration: BoxDecoration(
          color: classe.color.value, borderRadius: BorderRadius.circular(20)),
      child: LayoutBuilder(
        builder: (_, constraint) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: constraint.maxHeight * 0.2,
              width: constraint.maxWidth,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Container(
                    height: constraint.maxHeight,
                    width: constraint.maxWidth,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                  )),
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
                                  topLeft: Radius.circular(20))),
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
                          /* style: style, */
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  classe.name.value,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'Participantes: ${classe.members.value.length}',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
