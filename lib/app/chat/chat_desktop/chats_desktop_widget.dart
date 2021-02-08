import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/chat_controller.dart';
import 'package:uclass/domain/entities/conversation.dart';
import 'package:uclass/domain/entities/message.dart';
import 'package:uclass/src/utils/date_convert.dart';

import '../chat_message_widget.dart';

class ChatsDesktopWidget extends StatelessWidget {
  final BoxConstraints constraints;
  ChatsDesktopWidget({@required this.constraints});
  final controller = GetIt.I.get<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: constraints.maxWidth * 0.1,
        child: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
              valueListenable: controller.conversations,
              builder: (_, value, child) => Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: controller.activeConversations
                        .map(
                          (conversation) => AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                color: Colors.white,
                              ),
                              height: conversation.isOpened.value
                                  ? constraints.maxHeight * 0.4
                                  : constraints.maxHeight * 0.05,
                              width: constraints.maxWidth * 0.2,
                              child: LayoutBuilder(
                                  builder: (_, constraint) => Column(children: [
                                        topBar(conversation),
                                        Visibility(
                                            visible:
                                                conversation.isOpened.value,
                                            child: center(conversation)),
                                        Visibility(
                                            visible:
                                                conversation.isOpened.value,
                                            child: bottomBar(conversation))
                                      ]))),
                        )
                        .toList(),
                  )
              /* ValueListenableBuilder(
                  valueListenable: controller.conversation,
                  builder: (_, Conversation value, child) => */
              ),
        ));
  }

  topBar(Conversation conversation) => Flexible(
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
                  Container(
                      margin:
                          EdgeInsets.only(right: constraint.maxWidth * 0.03),
                      padding: EdgeInsets.symmetric(
                          vertical: constraint.maxHeight * 0.1),
                      child: Image.asset(
                        'assets/avatar.png',
                      )),
                  Text(
                    conversation.user.value.name.value,
                  ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        iconSize: 14,
                        color: Colors.white,
                        icon: Icon(Icons.remove),
                        onPressed: conversation.changeIsOpened),
                    IconButton(
                        color: Colors.white,
                        iconSize: 14,
                        icon: Icon(Icons.close),
                        onPressed: conversation.changeActive),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  center(Conversation conversation) => Expanded(
        flex: 8,
        child: LayoutBuilder(
            builder: (_, constraint) => SingleChildScrollView(
                  child: Column(
                    children: conversation.orderByDateMessageView
                        .map<Widget>((e) => Column(
                              children: [
                                Text(
                                  DateConvert().dateBrWeekDayMonth(e.date),
                                  style: TextStyle(color: Colors.black),
                                ),
                                Column(
                                  children: e.messages
                                      .map((message) => ChatMessageWidget(
                                            constraint: constraint,
                                            receiver:
                                                message.userReceiveId.value ==
                                                    0,
                                            message: message,
                                          ))
                                      .toList(),
                                )
                              ],
                            ))
                        .toList(),
                  ),
                )
            /* ListView(
            scrollDirection: Axis.vertical,
            children: conversation.messages.value
                .map<Widget>((Message e) => ChatMessageWidget(
                      constraint: constraint,
                      receiver: e.userReceiveId.value == 0,
                      message: e,
                    ))
                .toList(),
          ), */
            ),
      );
  bottomBar(Conversation conversation) {
    return Flexible(
      flex: 1,
      child: LayoutBuilder(
          builder: (_, constraint) => Container(
                margin: EdgeInsets.symmetric(
                    vertical: constraint.maxHeight * 0.1,
                    horizontal: constraint.maxWidth * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          onSubmitted: (v) => conversation.addMessage(),
                          controller: conversation.message.value,
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
                    InkWell(
                      onTap: conversation.addMessage,
                      child: Container(
                          height: constraint.maxHeight * 0.6,
                          width: constraint.maxWidth * 0.1,
                          child: Image.asset('assets/send.png')),
                    )
                  ],
                ),
              )),
    );
  }
}
