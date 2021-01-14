import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/chat/chat_controller.dart';
import 'package:uclass/src/models/message_model.dart';

import 'chat_message_widget.dart';

class ChatWidget extends StatelessWidget {
  final controller = GetIt.I.get<ChatController>();
  final List<MessageModel> list = [
    MessageModel(
        message:
            't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        date: DateTime(2021, 01, 14, 14, 00, 01),
        userReceiveId: 0,
        userSenderId: 1),
    MessageModel(
        message: 'Tudo e você?',
        date: DateTime(2021, 01, 14, 14, 05, 00),
        userReceiveId: 1,
        userSenderId: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraint) => Material(
        color: Colors.transparent,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ValueListenableBuilder(
                  valueListenable: controller.conversations.value[0].isOpened,
                  builder: (_, value, child) => AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        height: value
                            ? constraint.maxHeight
                            : constraint.maxHeight * 0.1,
                        width: constraint.maxWidth * 0.45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              width: constraint.maxWidth * 0.45,
                              height: constraint.maxHeight * 0.1,
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraint.maxWidth * 0.02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20)),
                                color: controller
                                    .conversations.value[0].color.value,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Fulano de tal'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () => controller
                                            .conversations.value[0]
                                            .changeIsOpened(),
                                      ),
                                      IconButton(
                                          icon: Icon(Icons.close),
                                          onPressed: () => null)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Expanded(
                                    child: LayoutBuilder(
                                  builder: (_, constraint) => ListView(
                                    scrollDirection: Axis.vertical,
                                    children: list
                                        .map<Widget>((MessageModel e) =>
                                            ChatMessageWidget(
                                              constraint: constraint,
                                              receiver:
                                                  e.userReceiveId.value == 0,
                                              message: e,
                                            ))
                                        .toList(),
                                  ),
                                )),
                                Row(
                                  children: [
                                    Container(
                                      decoration:
                                          BoxDecoration(color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ))
                          ],
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
