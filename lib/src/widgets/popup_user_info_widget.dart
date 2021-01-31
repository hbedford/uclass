import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/popup_user_controller.dart';
import 'package:uclass/src/utils/paint_triangle.dart';

class PopUpUserInfoWidget extends StatelessWidget {
  final controller = GetIt.I.get<PopUpUserController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height -
          (controller.position.value.dy) / 1.9,
      left: controller.position.value.dx - 80,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                /*  padding: EdgeInsets.symmetric(
                    horizontal: controller.anchorSize.value.width,
                    vertical: controller.anchorSize.value.height), */
                /* height: 200, */
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
                                Image.asset(controller.user.value.image.value),
                              ],
                            )),
                        Flexible(
                            flex: 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () => controller.hideOverlay(),
                                  icon: Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                    Text(
                      controller.user.value.name.value,
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
                    RaisedButton(
                      onPressed: () => null,
                      child: Text('Avaliar'),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => null,
                      child: Text('Adicionar a sua rede'),
                    ),
                    RaisedButton(
                      onPressed: () => null,
                      child: Text('Cancelar Convite'),
                    ),
                    Text('Aguardando aceitar o convite')
                  ],
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
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
        ),
      ),
    );
  }
}
