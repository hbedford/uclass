import 'package:flutter/material.dart';
import 'package:uclass/src/models/menu_model.dart';
import 'package:uclass/src/utils/date_convert.dart';

class LeftSideDesktop extends StatelessWidget {
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 16);
  final List listMenu = [
    MenuModel(name: 'MEU DASH'),
    MenuModel(
      name: 'SALAS',
    ),
    MenuModel(name: 'SOCIAL'),
    MenuModel(name: 'CALENDARIO')
  ];
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        color: Color(0xff13191E),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  'Uclass',
                  style:
                      style.copyWith(fontWeight: FontWeight.w900, fontSize: 30),
                ),
              ),
            ),
            Flexible(
                flex: 2,
                child: LayoutBuilder(
                    builder: (_, constraint) => Column(
                          children: listMenu
                              .map<Widget>((e) => Container(
                                    height: constraint.maxHeight * 0.15,
                                    width: constraint.maxWidth,
                                    color: listMenu.indexOf(e) == 0
                                        ? Theme.of(context)
                                            .scaffoldBackgroundColor
                                        : Colors.transparent,
                                    child: Center(
                                      child: Text(
                                        e.name,
                                        style: style,
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ))),
            Spacer(
              flex: 2,
            ),
            Flexible(
                child: LayoutBuilder(
              builder: (_, constraint) => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateConvert()
                        .dayWeekComplet(DateTime.now())
                        .toString()
                        .toUpperCase(),
                    style: style.copyWith(color: Colors.white54),
                  ),
                  Text(
                    DateConvert().dateBrString(DateTime.now()),
                    style: style.copyWith(color: Colors.white30),
                  ),
                  Container(
                    height: constraint.maxHeight * 0.1,
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
