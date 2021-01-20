import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String title;
  final String message;
  NotificationWidget({this.title, this.message});
  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) => Container(
        width: constraint.maxWidth * 0.25,
        padding: EdgeInsets.only(left: 40, right: 5),
        decoration: BoxDecoration(
            color: Colors.white60, borderRadius: BorderRadius.circular(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: style),
              Text(message, style: style),
            ],
          ),
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () => null,
            color: Colors.white,
          )
        ]),
      ),
    );
  }
}
