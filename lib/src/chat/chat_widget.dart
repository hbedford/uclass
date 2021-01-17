import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/chat/chat_controller.dart';
import 'package:uclass/src/home/home_mobile.dart';
import 'package:uclass/src/models/message_model.dart';
import 'package:flutter/foundation.dart' as platform;
import 'package:uclass/src/widgets/textfield_widget.dart';
import 'chat_message_widget.dart';

class ChatWidget extends StatelessWidget {
  final BoxConstraints constraints;
  ChatWidget({this.constraints});
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

  final TextStyle style = TextStyle(fontFamily: 'Gotham', color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        child: platform.kIsWeb ? web() : mobileCircle(context));
  }

  web() => Container(
        height: constraints.maxHeight * 0.5,
        width: constraints.maxWidth * 0.5,
        child: LayoutBuilder(
          builder: (_, constraint) => Material(
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ValueListenableBuilder(
                      valueListenable:
                          controller.conversations.value[0].isOpened,
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
                                Expanded(
                                  /* flex: 9, */
                                  child: LayoutBuilder(
                                    builder: (_, constraint) => Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              constraint.maxWidth * 0.02),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                  ),
                                ),
                                Expanded(
                                    flex: value ? 8 : 0,
                                    child: Visibility(
                                      visible: value,
                                      child: LayoutBuilder(
                                        builder: (_, constraint) => ListView(
                                          scrollDirection: Axis.vertical,
                                          children: list
                                              .map<Widget>((MessageModel e) =>
                                                  ChatMessageWidget(
                                                    constraint: constraint,
                                                    receiver:
                                                        e.userReceiveId.value ==
                                                            0,
                                                    message: e,
                                                  ))
                                              .toList(),
                                        ),
                                      ),
                                    )),
                                Flexible(
                                    flex: value ? 1 : 0,
                                    child: Visibility(
                                        visible: value, child: bottomBar()))
                              ],
                            ),
                          )),
                ],
              )),
        ),
      );

  mobileCircle(BuildContext context) => Container(
      margin: EdgeInsets.only(
          right: constraints.maxWidth * 0.03,
          bottom: constraints.maxHeight * 0.02),
      height: constraints.maxWidth * 0.15,
      width: constraints.maxWidth * 0.15,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () => showDialog(
                context: context, builder: (ctxt) => mobileChat(ctxt)),
            child: Container(
              height: constraints.maxWidth * 0.15,
              width: constraints.maxWidth * 0.15,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(100)),
              child: Image.asset(
                'assets/avatar.png',
              ),
            )),
      ));
  mobileChat(BuildContext context) => Material(
        child: Container(
          child: Column(
            children: [
              Flexible(
                flex: 1,
                child: LayoutBuilder(
                  builder: (_, constraint) => Container(
                    padding: EdgeInsets.symmetric(
                        vertical: constraint.maxHeight * 0.1,
                        horizontal: constraint.maxWidth * 0.05),
                    color: Colors.blueAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/avatar.png',
                            ),
                            Text('Professor Goku'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.videocam),
                            Icon(Icons.remove),
                            IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () => Navigator.pop(context))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 11,
                  child: LayoutBuilder(
                    builder: (_, constraint) => Column(
                      children: list
                          .map<Widget>((e) => ChatMessageWidget(
                                constraint: constraint,
                                message: e,
                                receiver: e.userReceiveId.value == 0,
                              ))
                          .toList(),
                    ),
                  )),
              Flexible(
                flex: 1,
                child: LayoutBuilder(
                  builder: (_, constraint) => Container(
                    padding: EdgeInsets.symmetric(
                        vertical: constraint.maxHeight * 0.2),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Expanded(child: TextFieldWidget()),
                        Image.asset('assets/send.png')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  mobileNotification() => ValueListenableBuilder(
        valueListenable: controller.notification,
        builder: (_, value, child) => AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.only(
              right: constraints.maxWidth * 0.03,
              bottom: constraints.maxHeight * 0.02),
          height:
              value ? constraints.maxHeight * 0.15 : constraints.maxWidth * 0.1,
          width:
              value ? constraints.maxWidth * 0.6 : constraints.maxWidth * 0.1,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () =>
                  controller.changeNotification(!controller.notification.value),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.03,
                    vertical: constraints.maxHeight * 0.01),
                height: value
                    ? constraints.maxHeight * 0.15
                    : constraints.maxWidth * 0.1,
                width: value
                    ? constraints.maxWidth * 0.3
                    : constraints.maxWidth * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(20)),
                child: !value
                    ? CircleAvatar()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Prova de Biologia reagendada',
                                      style: style.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      'Professor Goku',
                                      style: style.copyWith(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12),
                                    ),
                                    Text('09:45, 02 de fev de 2021',
                                        style: style.copyWith(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w800))
                                  ],
                                ),
                              ),
                              Flexible(flex: 2, child: CircleAvatar())
                            ],
                          ),
                          Container(
                            height: constraints.maxHeight * 0.04,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () => null,
                              child: Text(
                                '+ calendario',
                                style:
                                    style.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ),
      );
  bottomBar() => LayoutBuilder(
      builder: (_, constraint) => Container(
            margin: EdgeInsets.symmetric(vertical: constraint.maxHeight * 0.1),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.add_circle_rounded,
                      color: Colors.grey,
                    ),
                    onPressed: () => null)
              ],
            ),
          ));
}
