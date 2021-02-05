import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/chat_controller.dart';
import 'package:uclass/domain/entities/message.dart';

import '../chat_message_widget.dart';

class ChatsDesktopWidget extends StatelessWidget {
  final BoxConstraints constraints;
  ChatsDesktopWidget({this.constraints});
  final controller = GetIt.I.get<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: constraints.maxWidth * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ValueListenableBuilder(
                  valueListenable: controller.conversations,
                  builder: (_, value, child) => AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      height: value
                          ? constraints.maxHeight * 0.4
                          : constraints.maxHeight * 0.05,
                      width: constraints.maxWidth * 0.2,
                      child: LayoutBuilder(
                          builder: (_, constraint) => Column(children: [
                                topBar(),
                                Visibility(visible: value, child: center()),
                                Visibility(visible: value, child: bottomBar())
                              ]))))
            ],
          ),
        ));
  }

  topBar() => Flexible(
        flex: 1,
        child: LayoutBuilder(
          builder: (_, constraint) => Container(
            padding:
                EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.05),
            height: constraint.maxHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.blue[300],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Visibility(
                      child: Container(
                          margin: EdgeInsets.only(
                              right: constraint.maxWidth * 0.03),
                          padding: EdgeInsets.symmetric(
                              vertical: constraint.maxHeight * 0.1),
                          child: Image.asset(
                            'assets/avatar.png',
                          ))),
                  Text(
                    'Fulano de tal',
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      iconSize: 14,
                      color: Colors.white,
                      icon: Icon(Icons.remove),
                      onPressed: () =>
                          controller.conversations.value[0].changeIsOpened(),
                    ),
                    IconButton(
                        color: Colors.white,
                        iconSize: 14,
                        icon: Icon(Icons.close),
                        onPressed: () => null)
                  ],
                )
              ],
            ),
          ),
        ),
      );
  center() => Expanded(
        flex: 8,
        child: LayoutBuilder(
          builder: (_, constraint) => ListView(
            scrollDirection: Axis.vertical,
            children: controller.conversation.value.messages.value
                .map<Widget>((Message e) => ChatMessageWidget(
                      constraint: constraint,
                      receiver: e.userReceiveId.value == 0,
                      message: e,
                    ))
                .toList(),
          ),
        ),
      );
  bottomBar() {
    return Flexible(
      flex: 1,
      child: LayoutBuilder(
          builder: (_, constraint) => Container(
                margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.1,
                    horizontal: constraint.maxWidth * 0.02),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.add_circle_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () => null),
                    /*  Expanded(
                        child:  */
                    Expanded(
                      child: Container(
                        height: constraint.maxHeight,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          /* textAlignVertical: TextAlignVertical.center, */
                          decoration: InputDecoration(
                              alignLabelWithHint: true,
                              /*  border: border,
                              disabledBorder: border,
                              enabledBorder: border,
                              focusedBorder: border,
                              errorBorder: border, */
                              hintText: 'Digite a mensagem',
                              fillColor: Colors.transparent,
                              filled: true),
                          style: TextStyle(color: Colors.black),
                        ), /* TextFieldWidget(
                            radius: 20,
                            height: constraint.maxHeight,
                            width: constraint.maxWidth * 0.6,
                            hint: 'Digite a mensagem',
                            onChange: (v) => null,
                            /* padding: EdgeInsets.symmetric(
                                  horizontal: constraint.maxWidth * 0.05,
                                  vertical: constraint.maxHeight * 0.01), */
                            /* margin: EdgeInsets.symmetric(
                                  vertical: constraint.maxHeight * 0.02), */
                            color: Colors.grey[300],
                          ), */
                      ),
                    ),
                    /*   ), */
                    Container(
                        height: constraint.maxHeight * 0.6,
                        width: constraint.maxWidth * 0.1,
                        child: Image.asset('assets/send.png'))
                  ],
                ),
              )),
    );
  }
}
