import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/class.dart';

import 'class_desktop_widget.dart';
import 'class_withpercent_desktop_widget.dart';

class ClassesDesktopWidget extends StatelessWidget {
  final List<Class> list;
  final bool withPercent;
  ClassesDesktopWidget({@required this.list, this.withPercent = false});
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: LayoutBuilder(
          builder: (_, constraint) => Column(
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (_, constraints) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (_, index) => withPercent
                        ? ClassWithPercentDesktopWidget(
                            classe: list[index], constraint: constraints)
                        : ClassDesktopWidget(
                            classe: list[index], constraint: constraints),
                  ),
                ),
              ),
              Container(height: constraint.maxHeight * 0.05)
            ],
          ),
        ));
  }
}
