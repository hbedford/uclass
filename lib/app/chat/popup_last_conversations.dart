import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/app/chat/chat_controller.dart';
import 'package:uclass/domain/entities/message.dart';
import 'package:uclass/src/utils/paint_triangle.dart';

import 'chat_message_widget.dart';
import 'chat_widget.dart';

class PopUpLastConversations extends StatefulWidget {
  @override
  _PopUpLastConversationsState createState() => _PopUpLastConversationsState();
}

class _PopUpLastConversationsState extends State<PopUpLastConversations> {
  final controller = GetIt.I.get<ChatController>();

  //Chat apontando para a bolha
  /* OverlayEntry chatPopUp() {
    Size size = Scaffold.of(context).context.size;
    var width = size.width;
    var height = size.height;

    return OverlayEntry(builder: (context) {
      return Positioned(
        bottom: 0,
        child: CompositedTransformFollower(
          followerAnchor: Alignment.bottomRight,
          targetAnchor: Alignment.bottomLeft,
          link: controller.link,
          offset: Offset(0, 0),
          child: Material(
            color: Colors.transparent,
            child: Container(
              height: height * 0.4,
              width: width * 0.2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 11,
                    child: LayoutBuilder(
                      builder: (_, constraint) => Column(
                        children: [
                          Flexible(
                            flex: 1,
                            child: LayoutBuilder(
                              builder: (_, constraint) => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: constraint.maxWidth * 0.05),
                                height: constraint.maxHeight,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Colors.blue[300],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Visibility(
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                  right: constraint.maxWidth *
                                                      0.03),
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      constraint.maxHeight *
                                                          0.1),
                                              child: Image.asset(
                                                'assets/avatar.png',
                                              ))),
                                      Text('Fulano de tal'),
                                    ]),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        IconButton(
                                          iconSize: 14,
                                          color: Colors.white,
                                          icon: Icon(Icons.remove),
                                          onPressed: () => controller
                                              .conversations.value[0]
                                              .changeIsOpened(),
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
                          ),
                          Expanded(
                            flex: 8,
                            child: Container(
                              color: Colors.white,
                              child: LayoutBuilder(
                                builder: (_, constraint) => ListView(
                                  scrollDirection: Axis.vertical,
                                  children: list
                                      .map<Widget>(
                                          (Message e) => ChatMessageWidget(
                                                constraint: constraint,
                                                receiver:
                                                    e.userReceiveId.value == 0,
                                                message: e,
                                              ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              color: Colors.white,
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
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextField(
                                            textAlignVertical:
                                                TextAlignVertical.center,
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
                                            style:
                                                TextStyle(color: Colors.black),
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
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                      flex: 1,
                      child: LayoutBuilder(
                          builder: (_, constraint) => SizedBox(
                                height: constraint.maxHeight * 0.1,
                                width: constraint.maxWidth,
                                child: RotatedBox(
                                  quarterTurns: 75,
                                  child: CustomPaint(
                                    painter: TrianglePainter(
                                        color: Colors.white, isDown: true),
                                  ),
                                ),
                              )))
                ],
              ),
            ),
          ),
        ),
      );
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: controller.conversations.value
          .map<Widget>((e) => CompositedTransformTarget(
                link: controller.link,
                child: InkWell(
                  onTap: () => controller.openChat(context, e),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(e.user.value.image.value),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
