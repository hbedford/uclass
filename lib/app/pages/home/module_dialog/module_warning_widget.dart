import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/button_rectangular_widget.dart';

class ModuleWarningWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RectangularButtonWidget(
                constraint: constraint,
                title: 'Texto',
                color: Colors.blueAccent,
              ),
              Text(
                'Digite o texto do seu aviso',
                style: TextStyle(color: Colors.white38),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RectangularButtonWidget(
                constraint: constraint,
                title: 'Arquivo',
                color: Colors.greenAccent,
              ),
              Text(
                'Digite o texto do seu aviso',
                style: TextStyle(color: Colors.white38),
              )
            ],
          )
        ],
      ),
    );
  }
}
