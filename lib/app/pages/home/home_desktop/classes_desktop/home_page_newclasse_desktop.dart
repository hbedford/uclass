import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/popup_user_controller.dart';
import 'package:uclass/app/pages/classe/classe_controller.dart';
import 'package:uclass/domain/entities/user.dart';
import 'package:uclass/infra/moka/moka_members.dart';
import 'package:uclass/src/widgets/button_check_widget.dart';
import 'package:uclass/src/widgets/button_rectangular_widget.dart';
import 'package:uclass/src/widgets/button_widget.dart';
import 'package:uclass/src/widgets/manage_invites_widget.dart';
import 'package:uclass/src/widgets/textfield_widget.dart';

class HomePageNewClassDesktop extends StatefulWidget {
  @override
  _HomePageNewClassDesktopState createState() =>
      _HomePageNewClassDesktopState();
}

class _HomePageNewClassDesktopState extends State<HomePageNewClassDesktop> {
  final controller = GetIt.I.get<ClasseController>();
  final popController = GetIt.I.get<PopUpUserController>();
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: LayoutBuilder(
            builder: (_, constraint) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                controller.classe.value.name.value ?? '<Nome da sala nova>',
                style: style,
              ),
              ValueListenableBuilder(
                  valueListenable: controller.step,
                  builder: (_, value, child) =>
                      value == 1 ? step1(context, constraint) : step2(context))
            ]),
          ),
        ),
      ],
    );
  }

  step1(BuildContext context, BoxConstraints constraint) => Expanded(
        child: Row(children: [
          Expanded(
            flex: 5,
            child: LayoutBuilder(
              builder: (_, constraints) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: constraint.maxHeight * 0.02),
                    child: Text(
                      'CONFIGURE SUA NOVA SALA',
                      style: style,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: constraint.maxWidth * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            child: LayoutBuilder(
                              builder: (_, size) => Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Descrição',
                                      style: style,
                                    ),
                                    Container(
                                        width: size.maxWidth * 0.6,
                                        height: size.maxHeight * 0.6,
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                constraint.maxWidth * 0.01,
                                            vertical:
                                                constraint.maxHeight * 0.02),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: TextField(
                                          maxLines: 8,
                                          style: TextStyle(color: Colors.black),
                                          decoration: InputDecoration.collapsed(
                                              fillColor: Colors.white,
                                              hoverColor: Colors.white,
                                              hintText: 'Descrição da sala',
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                        )),
                                    Row(children: [
                                      Text('N° de vagas', style: style),
                                      Container(
                                          height: size.maxHeight * 0.2,
                                          margin: EdgeInsets.only(
                                              left: size.maxWidth * 0.01,
                                              right: size.maxWidth * 0.03),
                                          width: size.maxWidth * 0.15,
                                          child: ValueListenableBuilder(
                                            valueListenable: controller
                                                .classe.value.limitMembers,
                                            builder: (_, value, child) =>
                                                TextFieldWidget(
                                              controller: controller
                                                  .classe.value.limitEdit.value,
                                              onChange: controller.classe.value
                                                  .changeLimitMembers,
                                              textInputType:
                                                  TextInputType.number,
                                              color: Colors.grey,
                                            ),
                                          )),
                                      Text(
                                        'Sem limites',
                                        style: style,
                                      ),
                                      ValueListenableBuilder(
                                        valueListenable: controller
                                            .classe.value.limitMembers,
                                        builder: (_, String value, child) =>
                                            ButtonCheckWidget(
                                                f: () => controller.classe.value
                                                    .changeLimitMembers(''),
                                                check: value.isEmpty,
                                                margin: EdgeInsets.only(
                                                    left: constraint.maxWidth *
                                                        0.02,
                                                    right:
                                                        constraints.maxWidth *
                                                            0.01)),
                                      )
                                    ]),
                                  ]),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Flexible(
                              flex: 1,
                              child: Text('Configurações adicionais:',
                                  style: style)),
                          Flexible(
                            flex: 1,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      ButtonCheckWidget(
                                          f: () => null,
                                          check: true,
                                          margin: EdgeInsets.only(
                                              left: constraint.maxWidth * 0.02,
                                              right:
                                                  constraints.maxWidth * 0.01)),
                                      Text(
                                        'Vídeo ao vivo',
                                        style: style,
                                      ),
                                      ButtonCheckWidget(
                                          f: () => null,
                                          check: true,
                                          margin: EdgeInsets.only(
                                              left: constraint.maxWidth * 0.02,
                                              right:
                                                  constraints.maxWidth * 0.01)),
                                      Flexible(
                                        child: FittedBox(
                                          fit: BoxFit.fitWidth,
                                          child: Text(
                                              'Armazenamento de arquivos',
                                              style: style),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      ButtonCheckWidget(
                                          f: () => null,
                                          check: true,
                                          margin: EdgeInsets.only(
                                              left: constraint.maxWidth * 0.02,
                                              right:
                                                  constraints.maxWidth * 0.01)),
                                      Text('Canais de voz', style: style),
                                      ButtonCheckWidget(
                                          f: () => null,
                                          check: true,
                                          margin: EdgeInsets.only(
                                              left: constraint.maxWidth * 0.02,
                                              right:
                                                  constraints.maxWidth * 0.01)),
                                      Text('Canais de texto', style: style)
                                    ],
                                  )
                                ]),
                          ),
                          Flexible(
                            flex: 3,
                            child: Row(children: [
                              Container(
                                margin: EdgeInsets.only(
                                    right: constraint.maxWidth * 0.02),
                                child: ButtonWidget(
                                  title: 'CONTINUAR',
                                  f: () => controller.changeStep(2),
                                  height: constraint.maxHeight * 0.05,
                                  width: constraint.maxWidth * 0.1,
                                  style: style.copyWith(
                                      fontWeight: FontWeight.w100),
                                ),
                              ),
                              ButtonWidget(
                                title: 'VOLTAR',
                                f: controller.cancelClass,
                                height: constraint.maxHeight * 0.05,
                                width: constraint.maxWidth * 0.1,
                                style:
                                    style.copyWith(fontWeight: FontWeight.w100),
                                color: Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    .primaryVariant,
                              ),
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ManageInvitesWidget()
        ]),
      );

  step2(BuildContext context) => Expanded(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: LayoutBuilder(
                builder: (_, constraint) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                        flex: 2,
                        child: LayoutBuilder(
                          builder: (_, size) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ADICIONAR MÓDULOS', style: style),
                              ValueListenableBuilder(
                                  valueListenable:
                                      controller.classe.value.modules,
                                  builder: (_, value, child) => listWrap(
                                      /*        size: size, */
                                      list: value,
                                      color: Colors.green,
                                      add: () {
                                        controller.classe.value.addModule();

                                        controller.classe.value.module.value
                                            .dialogEditModule(context);
                                      } /* 
                                          controller.classe.value.addModule() */
                                      ,
                                      f: () => null))
                            ],
                          ),
                        )),
                    Flexible(
                        flex: 2,
                        child: LayoutBuilder(
                          builder: (_, size) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ADICIONAR CANAIS DE TEXTO', style: style),
                              ValueListenableBuilder(
                                  valueListenable:
                                      controller.classe.value.textChannels,
                                  builder: (_, value, child) => listWrap(
                                      /*   size: size, */
                                      list: value,
                                      add: () => controller.classe.value
                                          .addTextChannel(),
                                      color: Colors.purple,
                                      f: () => null))
                            ],
                          ),
                        )),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ADICIONAR CANAIS DE VIDEO', style: style),
                          ValueListenableBuilder(
                              valueListenable:
                                  controller.classe.value.videoChannels,
                              builder: (_, value, child) => listWrap(
                                  add: () =>
                                      controller.classe.value.addVideoChannel(),
                                  list: value,
                                  color: Colors.amber[700],
                                  f: () => null))
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: LayoutBuilder(
                        builder: (_, size) => Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  right: constraint.maxWidth * 0.02),
                              child: ButtonWidget(
                                title: 'CONTINUAR',
                                f: () => controller.changeStep(2),
                                height: size.maxHeight * 0.2,
                                width: size.maxWidth * 0.2,
                                style:
                                    style.copyWith(fontWeight: FontWeight.w100),
                              ),
                            ),
                            ButtonWidget(
                              title: 'VOLTAR',
                              f: () => controller.changeStep(1),
                              height: size.maxHeight * 0.2,
                              width: size.maxWidth * 0.2,
                              style:
                                  style.copyWith(fontWeight: FontWeight.w100),
                              color: Theme.of(context)
                                  .buttonTheme
                                  .colorScheme
                                  .primaryVariant,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: controller.classe.value.members,
                      builder: (_, value, child) => Text(
                        'Participantes: ${value.length}',
                        style: style,
                      ),
                    ),
                    listMembers(context)
                  ],
                ),
              ),
            ),
            ManageInvitesWidget()
          ],
        ),
      );

  listWrap(
          {/* BoxConstraints size, */
          List list,
          Color color,
          Function f,
          Function add}) =>
      Expanded(
        flex: 1,
        child: LayoutBuilder(
          builder: (_, size) => Container(
              margin: EdgeInsets.symmetric(
                vertical: size.maxHeight * 0.1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                          direction: Axis.vertical,
                          /* s */
                          children: list
                              .map<Widget>(
                                  (e) => buttonCheck(e.name.value, size))
                              .toList()),
                    ),
                  ),
                  RectangularButtonWidget(
                    f: add /* controller.classe.value.addModule() */
                    ,
                    title: 'ADICIONAR +',
                    constraint: size,
                    margin: EdgeInsets.only(
                        right: size.maxWidth * 0.02,
                        bottom: size.maxHeight * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: size.maxHeight * 0.01,
                        horizontal: size.maxWidth * 0.05),
                    color: color,
                  )
                ],
              )),
        ),
      );

  listMembers(BuildContext context) {
    final List<User> members = MokaMembers().members;
    final LayerLink link = LayerLink();
    return Flexible(
        flex: 1,
        child: LayoutBuilder(
          builder: (_, constraint) => Wrap(
              children: members
                  .map(
                    (user) => CompositedTransformTarget(
                      link: link,
                      child: Container(
                        margin:
                            EdgeInsets.only(right: constraint.maxWidth * 0.02),
                        child: Tooltip(
                          message: user.name.value,
                          child: InkWell(
                            onTap: () => popController.showOverlay(
                                context, link, Size(40, 40), user),
                            child: Image.asset(user.image.value),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ));
  }

  buttonCheck(String title, BoxConstraints size) => Container(
        height: size.maxHeight * 0.3,
        width: size.maxWidth * 0.2,
        child: Row(
          children: [
            Text(
              title,
              style: style,
            ),
            Container(
                height: size.maxHeight * 0.1,
                child: Image.asset('assets/edit.png'))
          ],
        ),
      );
}
