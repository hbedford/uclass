import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/button_check_widget.dart';
import 'package:uclass/src/widgets/textfield_widget.dart';

import 'button_rectangular_widget.dart';

class ManageInvitesWidget extends StatelessWidget {
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                Text('GERENCIAR CONVITES', style: style.copyWith(fontSize: 16)),
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
                                RectangularButtonWidget(
                                  constraint: size,
                                  title: 'Gerar novo link',
                                  f: () => null,
                                  color: Colors.green[400],
                                ),
                                /*  InkWell(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.maxWidth * 0.05,
                                        vertical: size.maxHeight * 0.002),
                                    child: Text(
                                      'Gerar novo link',
                                      style: style.copyWith(fontSize: 16),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.green[400]),
                                  ),
                                ), */
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
                                child: LayoutBuilder(
                                  builder: (_, constraint) => ListView(
                                    children: [
                                      'Juliana Apsotolo',
                                      'Karen Golden',
                                      'Patricio Urugha',
                                      'Rosana Santiago'
                                    ]
                                        .map((e) => InkWell(
                                                child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      constraint.maxWidth *
                                                          0.05,
                                                  vertical:
                                                      constraint.maxHeight *
                                                          0.01),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                        flex: 1,
                                                        child: CircleAvatar()),
                                                    Expanded(
                                                      flex: 3,
                                                      child: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Text(
                                                            e,
                                                            style:
                                                                style.copyWith(
                                                                    color: Colors
                                                                        .black),
                                                          )),
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: ButtonCheckWidget(
                                                          f: () => null,
                                                          check: true,
                                                          margin: EdgeInsets.only(
                                                              left: constraint
                                                                      .maxWidth *
                                                                  0.02,
                                                              right: constraint
                                                                      .maxWidth *
                                                                  0.01)),
                                                    )
                                                  ]),
                                            )))
                                        .toList(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      RectangularButtonWidget(
                        constraint: size,
                        title: 'Convidar',
                        f: () => null,
                        color: Colors.purple,
                      )
                    ])),
          ))
        ]),
      ),
    );
  }
}
