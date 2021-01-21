import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/classes/classes_controller.dart';
import 'package:uclass/src/widgets/button_check_widget.dart';
import 'package:uclass/src/widgets/button_rectangular_widget.dart';
import 'package:uclass/src/widgets/button_widget.dart';
import 'package:uclass/src/widgets/manage_invites_widget.dart';
import 'package:uclass/src/widgets/textfield_widget.dart';

class HomePageNewClassDesktop extends StatelessWidget {
  final controller = GetIt.I.get<ClassesController>();
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          controller.classe.value.title.value ?? '<Nome da sala nova>',
          style: style,
        ),
        ValueListenableBuilder(
            valueListenable: controller.step,
            builder: (_, value, child) =>
                value == 1 ? step1(context, constraint) : step2(context))
      ]),
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
                                        child: TextFieldWidget(
                                          radius: 20,
                                          height: size.maxHeight * 0.6,
                                        )),
                                    Row(children: [
                                      Text('N° de vagas', style: style),
                                      Container(
                                          height: size.maxHeight * 0.25,
                                          margin: EdgeInsets.only(
                                              left: size.maxWidth * 0.01,
                                              right: size.maxWidth * 0.03),
                                          width: size.maxWidth * 0.15,
                                          child: TextFieldWidget()),
                                      Text(
                                        'Sem limites',
                                        style: style,
                                      ),
                                      ButtonCheckWidget(
                                          f: () => null,
                                          check: true,
                                          margin: EdgeInsets.only(
                                              left: constraint.maxWidth * 0.02,
                                              right:
                                                  constraints.maxWidth * 0.01)),
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
                                      FittedBox(
                                        fit: BoxFit.fitHeight,
                                        child: Text('Armazenamento de arquivos',
                                            style: style),
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
                                f: () => null,
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
                child: LayoutBuilder(
                    builder: (_, constraint) => Column(
                          children: [
                            Text('ADICIONAR MÓDULOS'),
                            Wrap(
                              children: [
                                RectangularButtonWidget(
                                  f: () => null,
                                  title: 'ADICIONAR +',
                                  constraint: constraint,
                                  color: Colors.green,
                                ),
                              ],
                            )
                          ],
                        ))),
            ManageInvitesWidget()
          ],
        ),
      );
}
