import 'package:flutter/material.dart';

class PopUpChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 10,
        width: 50,
        child: CustomPaint(
          painter: TrianglePainter(color: Colors.white, isDown: true),
        ),
      ),
    );
  }
}
