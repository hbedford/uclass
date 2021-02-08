import 'package:flutter/material.dart';
import 'package:uclass/src/utils/paint_triangle.dart';

class PopUpChat extends StatefulWidget {
  @override
  _PopUpChatState createState() => _PopUpChatState();
}

class _PopUpChatState extends State<PopUpChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 10,
        width: 50,
        child: RotatedBox(
          quarterTurns: 90,
          child: CustomPaint(
            painter: TrianglePainter(color: Colors.white, isDown: true),
          ),
        ),
      ),
    );
  }
}
