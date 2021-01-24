import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/button_rectangular_widget.dart';
import 'package:uclass/src/widgets/button_widget.dart';

class ModuleVideoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
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
                                vertical: constraint.maxHeight * 0.05),
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
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
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
                  ))
            ],
          ),
        ),
        Flexible(
            flex: 1,
            child: LayoutBuilder(
                builder: (_, size) => ListView(
                      children: [
                        Container(
                          height: size.maxHeight * 0.1,
                          child: Row(
                            children: [
                              Expanded(
                                  child: LayoutBuilder(
                                      builder: (_, constraint) => Column(
                                            children: [
                                              Text('00%'),
                                              Container()
                                            ],
                                          ))),
                              Flexible(child: Text('Aula1.PDF'))
                            ],
                          ),
                        )
                      ],
                    )))
      ],
    );
  }
}
