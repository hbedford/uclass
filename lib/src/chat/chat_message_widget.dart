import 'package:flutter/material.dart';
import 'package:uclass/src/models/message_model.dart';

class ChatMessageWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final MessageModel message;
  final bool receiver;
  ChatMessageWidget({this.constraint, this.message, this.receiver = false});
  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          !receiver ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        receiver ? Container() : button(),
        Container(
          width: constraint.maxWidth * 0.7,
          padding: EdgeInsets.symmetric(
              vertical: constraint.maxHeight * 0.025,
              horizontal: constraint.maxWidth * 0.05),
          margin: EdgeInsets.symmetric(
              vertical: constraint.maxHeight * 0.02,
              horizontal: constraint.maxWidth * 0.05),
          decoration: BoxDecoration(
              color: !receiver ? Colors.blue[300] : Colors.black26,
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            message.message.value,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.w400),
            textAlign: TextAlign.justify,
          ),
        ),
        receiver ? button() : Container(),
      ],
    );
  }

  button() => IconButton(icon: Icon(Icons.more_horiz), onPressed: () => null);
}
