import 'package:flutter/material.dart';

class ModuleTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) => Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                maxLines: 20,
              ),
            ),
            Flexible(
                flex: 1,
                child: LayoutBuilder(
                    builder: (_, constraints) => Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: constraint.maxWidth * 0.1),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Row(
                            children: [
                              Flexible(
                                  child: DropdownButton(
                                      items: [
                                'Sans Serif',
                                'San francisco',
                                'Gotham'
                              ]
                                          .map((e) =>
                                              DropdownMenuItem(child: Text(e)))
                                          .toList())),
                              Flexible(
                                  child: DropdownButton(
                                      hint: Image.asset('assets/font.png'),
                                      items: [
                                        8,
                                        9,
                                        10,
                                        11,
                                        12,
                                        14,
                                        16,
                                        18,
                                        20,
                                        35
                                      ]
                                          .map((e) => DropdownMenuItem(
                                              child: Text(e.toString())))
                                          .toList())),
                              TextButton(
                                onPressed: () => null,
                                child: Text('B'),
                              ),
                              TextButton(
                                onPressed: () => null,
                                child: Text('I'),
                              ),
                              TextButton(
                                onPressed: () => null,
                                child: Text('U'),
                              ),
                              TextButton(
                                onPressed: () => null,
                                child: Text('A'),
                              ),
                            ],
                          ),
                        )))
          ],
        ),
      ),
    );
  }
}
