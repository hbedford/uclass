import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/domain/entities/menu.dart';
import 'package:uclass/domain/entities/module.dart';
import 'package:uclass/src/classes/classes_controller.dart';

class DialogEditModuleWidget extends StatelessWidget {
  final menu = [
    Menu(name: 'Aula ao vivo', image: 'assets/live.png'),
    Menu(name: 'Video aula', image: 'assets/callvideo.png'),
    Menu(name: 'Material', image: 'assets/folders.png'),
    Menu(name: 'Correção', image: 'assets/corrections.png'),
    Menu(name: 'Avisos', image: 'assets/warning.png')
  ];
  final controller = GetIt.I.get<ClassesController>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraint) => Material(
              color: Colors.transparent,
              child: Container(
                height: constraint.maxHeight * 0.7,
                width: constraint.maxWidth * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Row(
                  children: [
                    leftSide(),
                    center(controller.classe.value.module.value)
                  ],
                ),
              ),
            ));
  }

  leftSide() => Flexible(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: menu
              .map(
                (e) => InkWell(
                  child: Row(
                    children: [Image.asset(e.image), Text(e.name)],
                  ),
                ),
              )
              .toList(),
        ),
      );
  center(Module m) => Expanded(
      flex: 4,
      child: Column(
        children: [
          Flexible(
              child: Column(
            children: [
              InkWell(
                  child: Row(
                children: [
                  Text(m.name.value),
                  InkWell(
                    child: Image.asset('assets/edit.png'),
                  )
                ],
              ))
            ],
          ))
        ],
      ));
}
