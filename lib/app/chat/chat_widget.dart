import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart' as platform;
import 'package:uclass/domain/entities/message.dart';
import 'package:uclass/src/widgets/textfield_widget.dart';
import 'chat_controller.dart';
import 'chat_message_widget.dart';
import 'chat_screen.dart';

class ChatWidget extends StatelessWidget {
  final BoxConstraints constraints;
  ChatWidget({this.constraints});
  final controller = GetIt.I.get<ChatController>();
  final List<Message> list = [
    Message(
        message:
            't is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using',
        date: DateTime(2021, 01, 14, 14, 00, 01),
        userReceiveId: 0,
        userSenderId: 1),
    Message(
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
        right: constraints.maxWidth * 0.1,
        child: platform.kIsWeb && MediaQuery.of(context).size.width > 1320
            ? web()
            : mobileCircle(context));
  }

  web() => Material(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ValueListenableBuilder(
                valueListenable: controller.conversations.value[0].isOpened,
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
      );
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
                  Text('Fulano de tal', style: style),
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
            children: list
                .map<Widget>((Message e) => ChatMessageWidget(
                      constraint: constraint,
                      receiver: e.userReceiveId.value == 0,
                      message: e,
                    ))
                .toList(),
          ),
        ),
      );
  /* web() => Container(
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
                                  flex: 9,
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
                                  child: LayoutBuilder(
                                    builder: (_, constraint) => ListView(
                                      scrollDirection: Axis.vertical,
                                      children: list
                                          .map<Widget>((Message e) =>
                                              ChatMessageWidget(
                                                constraint: constraint,
                                                receiver:
                                                    e.userReceiveId.value == 0,
                                                message: e,
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                Flexible(
                                    flex: value ? 1 : 0, child: bottomBar())
                              ],
                            ),
                          )),
                ],
              )),
        ),
      ); */

  mobileCircle(BuildContext context) => Container(
      margin: EdgeInsets.only(
          right: constraints.maxWidth * 0.03,
          bottom: constraints.maxHeight * 0.02),
      height: constraints.maxWidth * 0.15,
      width: constraints.maxWidth * 0.15,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(0))),
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (ctxt) => Padding(
                      padding: MediaQuery.of(context).viewPadding,
                      child: ChatScreen(
                        list: list,
                      )),
                ),
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
