import 'package:flutter/material.dart';
import 'package:uclass/domain/entities/class.dart';

import 'class_mobile_widget.dart';
import 'class_withpercent_mobile_widget.dart';

class ClassesMobileWidget extends StatelessWidget {
  final List<Class> list;
  final bool withPercent;
  ClassesMobileWidget({this.list, this.withPercent = false});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: LayoutBuilder(
        builder: (_, constraint) => Container(
          margin: EdgeInsets.symmetric(vertical: constraint.maxHeight * 0.02),
          height: constraint.maxHeight * 0.15,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (_, index) => withPercent
                  ? ClassWithPercentMobileWidget(
                      classe: list[index], constraint: constraint)
                  : ClassMobileWidget(
                      classe: list[index], constraint: constraint)),
          /*  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: recentClasses
                    .map<Widget>((e) => classWithPercent(e, constraint))
                    .toList(),
              ),
            ), */
        ),
      ),
    );
  }
}
