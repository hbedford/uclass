import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/classes/classes_controller.dart';
import 'package:uclass/src/widgets/button_widget.dart';
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
        Expanded(
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
                        margin:
                            EdgeInsets.only(left: constraint.maxWidth * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 3,
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Descrição',
                                      style: style,
                                    ),
                                    Container(
                                        width: constraint.maxWidth * 0.3,
                                        child: TextFieldWidget(
                                          radius: 20,
                                          height: constraint.maxHeight * 0.20,
                                        )),
                                    Row(children: [
                                      Text('N° de vagas', style: style),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: constraint.maxWidth * 0.01,
                                              right:
                                                  constraint.maxWidth * 0.03),
                                          width: constraint.maxWidth * 0.05,
                                          child: TextFieldWidget()),
                                      Text(
                                        'Sem limites',
                                        style: style,
                                      ),
                                      buttonCheck(),
                                    ]),
                                  ]),
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
                                        buttonCheck(),
                                        Text(
                                          'Vídeo ao vivo',
                                          style: style,
                                        ),
                                        buttonCheck(),
                                        Text('Armazenamento de arquivos',
                                            style: style)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        buttonCheck(),
                                        Text('Canais de voz', style: style),
                                        buttonCheck(),
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
                                    f: () => null,
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
                                  style: style.copyWith(
                                      fontWeight: FontWeight.w100),
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
            rightInfo()
          ]),
        )
      ]),
    );
  }

  rightInfo() => Flexible(
        flex: 5,
        child: LayoutBuilder(
          builder: (_, constraint) =>
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(height: constraint.maxHeight * 0.05),
            Container(
              margin: EdgeInsets.only(bottom: constraint.maxHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('GERENCIAR CONVITES',
                      style: style.copyWith(fontSize: 16)),
                  Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              width: constraint.maxWidth * 0.45,
              padding:
                  EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.025),
              decoration: BoxDecoration(
                color: Color(0xff13191E),
                borderRadius: BorderRadius.circular(20),
              ),
              child: LayoutBuilder(
                  builder: (_, size) => Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Convite por link',
                              style: style,
                            ),
                            Container(
                              child:
                                  TextFieldWidget(hint: 'uclass.io/AcjjHfGC01'),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: size.maxWidth * 0.05,
                                          vertical: size.maxHeight * 0.002),
                                      child: Text(
                                        'Gerar novo link',
                                        style: style.copyWith(fontSize: 16),
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.green[400]),
                                    ),
                                  ),
                                  Icon(Icons.share, color: Colors.grey)
                                ])
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text('Sua rede', style: style),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: ListView(
                                    children: [
                                      'Juliana Apsotolo',
                                      'Karen Golden',
                                      'Patricio Urugha',
                                      'Rosana Santiago'
                                    ]
                                        .map((e) => InkWell(
                                                child: Container(
                                              child: Row(children: [
                                                CircleAvatar(),
                                                Text(e),
                                                buttonCheck()
                                              ]),
                                            )))
                                        .toList(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ])),
            ))
          ]),
        ),
      );
  buttonCheck() => Container(
        width: 15,
        height: 15,
        padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      );
}
