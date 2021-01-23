import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/utils/date_convert.dart';

import 'home_controller.dart';

class LeftSideDesktop extends StatelessWidget {
  final TextStyle style =
      TextStyle(fontFamily: 'Gotham', color: Colors.white, fontSize: 16);
  final controller = GetIt.I.get<HomeController>();

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
                          children: controller.menu.value
                              .map<Widget>((e) => ValueListenableBuilder(
                                    valueListenable: controller.page,
                                    builder: (_, value, child) => InkWell(
                                      onTap: () => controller.changePage(e.id),
                                      child: Container(
                                        height: constraint.maxHeight * 0.15,
                                        width: constraint.maxWidth,
                                        color: e.id == value
                                            ? Theme.of(context)
                                                .scaffoldBackgroundColor
                                            : Colors.transparent,
                                        child: Center(
                                          child: Text(
                                            e.name,
                                            style: style,
                                          ),
                                        ),
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
