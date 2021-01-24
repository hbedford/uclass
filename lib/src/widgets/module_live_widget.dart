import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/button_widget.dart';

class ModuleLiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Chave de transmissão:'),
                Text("************************"),
                IconButton(icon: Icon(Icons.visibility), onPressed: () => null)
              ],
            )),
        Flexible(
            flex: 1,
            child: LayoutBuilder(
              builder: (_, constraint) => Container(
                padding:
                    EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Adicionar data'),
                    ButtonWidget(
                      color: Colors.blue,
                      title: '26-03-2021',
                    ),
                    Text('Adicionar data'),
                    ButtonWidget(
                      color: Colors.green,
                      title: '26-03-2021',
                    ),
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
