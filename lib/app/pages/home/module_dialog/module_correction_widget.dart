import 'package:flutter/material.dart';
import 'package:uclass/src/widgets/button_check_widget.dart';

class ModuleCorrectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCheckWidget(
              check: true,
              f: () => null,
            ),
            Text('Adicionar material de correção')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonCheckWidget(
              check: true,
              f: () => null,
            ),
            Text('Acompanhar correção')
          ],
        ),
      ],
    );
  }
}
