import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/domain/entities/activity.dart';
import 'package:uclass/domain/entities/module.dart';
import 'package:uclass/src/classes/classes_controller.dart';
import 'package:uclass/src/widgets/button_widget.dart';

class DialogEditModuleWidget extends StatelessWidget {
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 20);
  final controllerClasse = GetIt.I.get<ClassesController>();

  @override
  Widget build(BuildContext context) {
    final controller = controllerClasse.classe.value;
    return LayoutBuilder(
        builder: (_, constraint) => Material(
              color: Colors.transparent,
              child: Container(
                height: constraint.maxHeight * 0.7,
                width: constraint.maxWidth * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Row(
                  children: [
                    leftSide(),
                    center(controller.module.value, context),
                    /* rightSide(context) */
                  ],
                ),
              ),
            ));
  }

  leftSide() => Flexible(
        flex: 1,
        child: LayoutBuilder(
          builder: (_, size) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: Activity()
                .types
                .map<Widget>(
                  (e) => Container(
                    margin: EdgeInsets.only(
                        left: size.maxWidth * 0.2, top: size.maxHeight * 0.02),
                    child: Draggable(
                      data: e,
                      feedback: Image.asset(e.image.value),
                      child: InkWell(
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                  right: size.maxWidth * 0.05,
                                ),
                                child: Image.asset(e.image.value)),
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(e.name.value,
                                  style: style.copyWith(fontSize: 12)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
  center(Module module, BuildContext context) => Expanded(
      flex: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            module.name.value ?? 'Novo modulo',
                            style: style,
                          ),
                          InkWell(
                            child: Image.asset('assets/edit.png'),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.pop(context)),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 8,
              child: LayoutBuilder(
                builder: (_, constraint) => ValueListenableBuilder(
                  valueListenable: module.activitys,
                  builder: (_, value, child) => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: module.activitys.value
                          .map<Widget>(
                            (e) => DragTarget(
                              onAccept: e.setType,
                              builder: (context, candidateData, rejectedData) =>
                                  Container(
                                margin: EdgeInsets.only(
                                    top: constraint.maxHeight * 0.03),
                                height: constraint.maxHeight *
                                    (e.type.value != null
                                        ? e.type.value.id.value == 2
                                            ? 0.6
                                            : 0.4
                                        : 0.4),
                                width: constraint.maxWidth,
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: LayoutBuilder(
                                        builder: (_, constraint) => Container(
                                          margin: EdgeInsets.only(
                                              top: constraint.maxHeight * 0.02,
                                              left: constraint.maxWidth * 0.02),
                                          height: constraint.maxHeight * 0.8,
                                          width: constraint.maxWidth * 0.98,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 7,
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.black87),
                                                    child: Center(
                                                      child: Text(
                                                        e.type.value != null
                                                            ? e.type.value.name
                                                                .value
                                                            : 'ADICIONAR ITEM',
                                                        style: style,
                                                      ),
                                                    )),
                                              ),
                                              Flexible(
                                                flex: 1,
                                                child: IconButton(
                                                    color: Colors.white,
                                                    icon: Icon(Icons.close),
                                                    onPressed: () => null),
                                              ),
                                              Flexible(
                                                  flex: 2, child: Container())
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                        visible: e.type.value != null,
                                        child: e.type.value != null
                                            ? Image.asset(
                                                e.type.value.image.value)
                                            : Container())
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              )),
          Flexible(
              flex: 2,
              child: LayoutBuilder(
                builder: (_, constraint) => Column(
                  children: [
                    InkWell(
                      onTap: () => module.addActivity(),
                      child: Container(
                        height: constraint.maxHeight * 0.5,
                        width: constraint.maxHeight * 0.5,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Text(
                            '+',
                            style: style.copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Adicionar Ação',
                      style: style.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              )),
          Flexible(
            flex: 3,
            child: LayoutBuilder(
              builder: (_, constraint) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(right: constraint.maxWidth * 0.02),
                      child: ButtonWidget(
                        title: 'SALVAR',
                        f: () => Navigator.pop(context),
                        height: constraint.maxHeight * 0.3,
                        width: constraint.maxWidth * 0.3,
                        style: style.copyWith(fontWeight: FontWeight.w100),
                      ),
                    ),
                    ButtonWidget(
                      title: 'VOLTAR',
                      f: () => null,
                      height: constraint.maxHeight * 0.3,
                      width: constraint.maxWidth * 0.3,
                      style: style.copyWith(fontWeight: FontWeight.w100),
                      color: Theme.of(context)
                          .buttonTheme
                          .colorScheme
                          .primaryVariant,
                    ),
                  ]),
            ),
          )
        ],
      ));
}
