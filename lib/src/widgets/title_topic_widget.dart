import 'package:flutter/cupertino.dart';

class TitleTopicWidget extends StatelessWidget {
  final String title;
  final BoxConstraints constraint;
  TitleTopicWidget({this.title, this.constraint});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: constraint.maxWidth * 0.00),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
      ),
    );
  }
}
