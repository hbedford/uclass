import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/button_rectangular_widget.dart';
import 'package:uclass/src/widgets/textfield_widget.dart';

class ModuleVideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Center(
                  child: LayoutBuilder(
                    builder: (_, constraint) => Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Adicionar material de apoio'),
                        Container(
                          margin:
                              EdgeInsets.only(left: constraint.maxWidth * 0.05),
                          child: RectangularButtonWidget(
                            constraint: constraint,
                            padding: EdgeInsets.symmetric(
                                vertical: constraint.maxHeight * 0.05,
                                horizontal: constraint.maxWidth * 0.05),
                            title: 'Upload',
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: LayoutBuilder(
                          builder: (_, constraint) => Container(
                            margin: EdgeInsets.only(
                                left: constraint.maxWidth * 0.1,
                                bottom: constraint.maxHeight * 0.1),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: ListView(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: constraint.maxWidth * 0.02),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: constraint.maxWidth * 0.05,
                                      vertical: constraint.maxHeight * 0.05),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Aula3.pdf'),
                                      IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () => null)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              Text('Adicionar link do video'),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child: TextFieldWidget(
                                      hint: 'http://',
                                    )),
                                    Flexible(
                                        child: LayoutBuilder(
                                      builder: (_, constraint) =>
                                          RectangularButtonWidget(
                                        constraint: constraint,
                                        color: Colors.green,
                                        f: () => null,
                                        title: 'Adicionar',
                                      ),
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  ))
            ],
          ),
        ),
        Flexible(
            flex: 1,
            child: LayoutBuilder(
              builder: (_, size) => Container(
                  margin: EdgeInsets.only(top: size.maxHeight * 0.05),
                  child: ListView(
                    children: [
                      Container(
                        height: size.maxHeight * 0.1,
                        margin: EdgeInsets.only(left: size.maxWidth * 0.1),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: LayoutBuilder(
                                    builder: (_, constraint) => Column(
                                          children: [
                                            Text(
                                              '00%',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Container(
                                              height:
                                                  constraint.maxHeight * 0.3,
                                              width: constraint.maxWidth,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                            )
                                          ],
                                        ))),
                            Flexible(
                                child: Text(
                              'Aula3.PDF',
                              style: TextStyle(fontSize: 12),
                            ))
                          ],
                        ),
                      )
                    ],
                  )),
            ))
      ],
    );
  }
}
