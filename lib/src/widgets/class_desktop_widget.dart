import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/pages/classe/classe_controller.dart';
import 'package:uclass/domain/entities/class.dart';

class ClassDesktopWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final Class classe;
  ClassDesktopWidget({this.classe, @required this.constraint});
  final controller = GetIt.I.get<ClasseController>();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: classe.id.value == null
          ? () => controller.newClass(context)
          : () => controller.changeClass(classe),
      child: Container(
        margin: EdgeInsets.only(
            left: constraint.maxWidth * 0.02,
            top: constraint.maxHeight * 0.1,
            bottom: constraint.maxHeight * 0.1),
        width: constraint.maxWidth * 0.2,
        decoration: BoxDecoration(
            color: classe.id.value == null ? Colors.grey : classe.color.value,
            borderRadius: BorderRadius.circular(20)),
        child: classe.id.value == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.add), Text('Adicionar Sala')],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          classe.name.value,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(),
                        Text(
                          'Prof:${classe.teacher.value.name.value}',
                          style: TextStyle(fontSize: 10),
                        ),
                        Text(
                          'Participantes:${classe.members.value.length}',
                          style: TextStyle(fontSize: 10),
                        ),
                        Container(),
                      ],
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
