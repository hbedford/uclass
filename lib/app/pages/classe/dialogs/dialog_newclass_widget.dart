import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/pages/classe/classe_controller.dart';
import 'package:uclass/src/widgets/autocomplement_textfield_widget.dart';
import 'package:uclass/src/widgets/button_widget.dart';
import 'package:uclass/src/widgets/textfield_widget.dart';
import 'package:uclass/src/widgets/title_topic_widget.dart';

class DialogNewClassWidget extends StatelessWidget {
  final controller = GetIt.I.get<ClasseController>();
  List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (_, constraints) => Material(
              color: Colors.transparent,
              child: Container(
                  height: constraints.maxHeight * 0.6,
                  width: constraints.maxWidth * 0.5,
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: LayoutBuilder(
                    builder: (_, constraint) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'NOVA SALA',
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleTopicWidget(
                              constraint: constraint,
                              title: 'Nome da sala',
                            ),
                            ValueListenableBuilder(
                              valueListenable:
                                  controller.classe.value.errorName,
                              builder: (_, error, child) => TextFieldWidget(
                                error: error,
                                hint: 'Dê um nome a sua nova sala',
                                onChange: controller.classe.value.changeName,
                                margin: EdgeInsets.only(
                                    bottom: constraint.maxHeight * 0.05),
                              ),
                            ),
                            TitleTopicWidget(
                              constraint: constraint,
                              title: 'Quem pode gerenciar esta sala?',
                            ),
                            Container(
                              /* padding: EdgeInsets.symmetric(
                                  vertical: constraint.maxHeight * 0.01), */
                              constraints: BoxConstraints(
                                  minHeight: constraint.maxHeight * 0.1),
                              width: constraint.maxWidth,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ValueListenableBuilder(
                                  valueListenable:
                                      controller.classe.value.admins,
                                  builder: (_, value, child) {
                                    children = [];

                                    children = value
                                        .map<Widget>((e) => InkWell(
                                              onTap: () => controller
                                                  .classe.value
                                                  .removeAdmin(e),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        constraint.maxWidth *
                                                            0.02,
                                                    vertical:
                                                        constraint.maxHeight *
                                                            0.01),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey),
                                                margin: EdgeInsets.only(
                                                    left: constraint.maxWidth *
                                                        0.02,
                                                    top: constraint.maxHeight *
                                                        0.005,
                                                    bottom:
                                                        constraint.maxHeight *
                                                            0.005),
                                                child: Wrap(
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.center,
                                                  children: [
                                                    Text(
                                                      e,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Icon(
                                                      Icons.close,
                                                      color: Colors.black,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ))
                                        .toList();
                                    children.add(
                                        /* Flexible(
                                          child: */
                                        Container(
                                      height: constraint.maxHeight * 0.1,
                                      width: constraint.maxWidth * 0.3,
                                      child: AutoCompletedTextField(
                                        itemSubmitted: (suggestion) =>
                                            controller.classe.value
                                                .addAdmin(suggestion),
                                        itemBuilder: (context, suggestion) =>
                                            Container(
                                                width:
                                                    constraint.maxWidth * 0.3,
                                                margin: EdgeInsets.only(
                                                    top: constraint.maxHeight *
                                                        0.02),
                                                padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        constraint.maxHeight *
                                                            0.02,
                                                    horizontal:
                                                        constraint.maxWidth *
                                                            0.05),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  suggestion,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                  ),
                                                )),
                                        filter: (item, query) {
                                          return item
                                              .toLowerCase()
                                              .startsWith(query.toLowerCase());
                                        },
                                        sort: (a, b) => a.compareTo(b),
                                        list: [
                                          'Hugo',
                                          'Marcio',
                                          'Hugo Monteiro Bedford Bedford'
                                        ],
                                        hint:
                                            'Exemplo: Nome sobrenome ou nome da instituição',
                                      ),
                                    ) /* ), */
                                        );
                                    return Wrap(
                                      children: children,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                    );
                                  }),
                            ),
                            /* TextFieldWidget(
                              onChange: (v) => null,
                              hint: 'Quem pode gerenciar esta sala',
                              margin: EdgeInsets.only(
                                  bottom: constraint.maxHeight * 0.01),
                            ), */
                            Text(
                              'E-mails, nomes de usuários ou instituições de ensino.',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white38),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonWidget(
                              title: 'CRIAR',
                              f: () => controller.addNameAndAdmins(context),
                              height: constraint.maxHeight * 0.1,
                              width: constraint.maxWidth * 0.3,
                              /* style: style */
                            ),
                            ButtonWidget(
                              title: 'CANCELAR',
                              color: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme
                                  .primaryVariant,
                              f: () => Navigator.pop(context),
                              height: constraint.maxHeight * 0.1,
                              width: constraint.maxWidth * 0.3,
                              /*  style: style, */
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ));
  }
}
