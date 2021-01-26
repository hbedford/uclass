import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/popup_user_controller.dart';
import 'package:uclass/src/utils/paint_triangle.dart';

class PopUpUserInfoWidget extends StatelessWidget {
  final controller = GetIt.I.get<PopUpUserController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: controller.position.value.dy -
          controller.anchorSize.value.height -
          200,
      left: controller.position.value.dx,
      child: Column(
        children: [
          Container(
            /*  padding: EdgeInsets.symmetric(
                horizontal: controller.anchorSize.value.width,
                vertical: controller.anchorSize.value.height), */
            height: 200,
            width: 200,
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset('assets/avatar1.png'),
                          ],
                        )),
                    Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ],
                        ))
                  ],
                ),
                Text(
                  'Fulano de tal',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  children: [
                    Icon(Icons.star_rate),
                    Icon(Icons.star_rate_outlined),
                  ],
                ),
                RaisedButton(
                  onPressed: () => null,
                  child: Text('Chat'),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(
            height: 10,
            width: 50,
            child: CustomPaint(
              painter: TrianglePainter(color: Colors.white, isDown: true),
            ),
          )
        ],
      ),
    );
  }
}
