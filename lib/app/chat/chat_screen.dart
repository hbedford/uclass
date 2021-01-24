import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:uclass/src/widgets/textfield_widget.dart';

import 'chat_controller.dart';
import 'chat_message_widget.dart';

class ChatScreen extends StatelessWidget {
  final List list;
  ChatScreen({this.list});
  final controller = GetIt.I.get<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 0,
          leading: Container(),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Fulano de tal'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () =>
                      controller.conversations.value[0].changeIsOpened(),
                ),
                IconButton(icon: Icon(Icons.close), onPressed: () => null)
              ],
            ),
          ])),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraint) => Column(
          children: [
            Expanded(
                flex: 8,
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
              flex: MediaQuery.of(context).viewInsets.bottom > 0 ? 2 : 1,
              child: LayoutBuilder(
                builder: (_, constraint) => Container(
                  padding: EdgeInsets.symmetric(
                      vertical: constraint.maxHeight * 0.2),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      Expanded(
                          child: TextFieldWidget(
                        margin: EdgeInsets.symmetric(
                            vertical: constraint.maxHeight * 0.01,
                            horizontal: constraint.maxWidth * 0.05),
                        color: Colors.grey,
                      )),
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
  }
}
